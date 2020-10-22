#!/usr/bin/env bash

# requires:
# - Alfred 4
# - Bitwarden v2 workflow [https://github.com/blacs30/bitwarden-alfred-workflow]

get_var_from_plist() {
	# 1=filename, 2=key
	[ -n "$2" ] || return 1
	[ -e "$1" ] || return 1
	/usr/bin/plutil -extract "$2" xml1 -o - -- "$1" |
	/usr/bin/sed -n "s/.*<string>\(.*\)<\/string>.*/\1/p"
}

prefs="$HOME/Library/Application Support/Alfred/prefs.json"
[ -e "${prefs}" ] || { echo "can't find Alfred prefs"; exit 1; }
wf_basedir=$(get_var_from_plist "${prefs}" current)/workflows
[ -e "${wf_basedir}" ] || { echo "can't find Alfred workflow dir"; exit 1; }

alfred_app_bundleid=com.runningwithcrayons.Alfred
export alfred_workflow_bundleid=com.lisowski-development.alfred.bitwarden
export alfred_workflow_cache="$HOME/Library/Caches/${alfred_app_bundleid}/Workflow Data/${alfred_workflow_bundleid}"
export alfred_workflow_data="$HOME/Library/Application Support/Alfred/Workflow Data/${alfred_workflow_bundleid}"
#wf_basedir=$(get_var_from_plist "$HOME/Library/Preferences/com.runningwithcrayons.Alfred-Preferences.plist" syncfolder)
infoplist=$(/usr/bin/find "${wf_basedir}" -name info.plist -depth 2 -exec /usr/bin/grep -H "<string>${alfred_workflow_bundleid}</string>" {} \; | awk -F: '{ print $1 }')
[ -e "${infoplist}" ] || { echo "can't find Bitwarden v2 workflow"; exit 1; }
wf_dir=${infoplist%/*}
alfred_workflow_version=$(get_var_from_plist "${infoplist}" version)
[ -n "${alfred_workflow_version}" ] || { echo "can't determine workflow version"; exit 1; }
echo "found workflow v${alfred_workflow_version} at ${wf_dir}"
export alfred_workflow_version
bwpath=$(get_var_from_plist "${infoplist}" variables.PATH)
[ -n "${bwpath}" ] || { echo "PATH variable not set in workflow"; exit 1; }
export PATH=${bwpath}
bwexec=$(get_var_from_plist "${infoplist}" variables.BW_EXEC)
if ! hash "${bwexec}" 2>/dev/null; then 
	echo "bw command not found, check PATH env variable"; exit 1;
fi
export BW_EXEC=${bwexec}
wf_bin="${wf_dir}/bitwarden-alfred-workflow"

/usr/bin/xattr -d com.apple.quarantine "$wf_bin" 2>/dev/null
"$wf_bin" -sync -force
#"$wf_bin" -cache
#"$wf_bin" -icons
