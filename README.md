![](/sync.png)
## bw-cache-update
## _a companion for https://github.com/blacs30/bitwarden-alfred-workflow_

## Installation

1. Copy the entire line below (triple-click) and paste it into a Terminal window: 

```
curl -o /usr/local/bin/bw_cache_update.sh https://raw.githubusercontent.com/luckman212/bw-cache-update/main/bw_cache_update.sh && chmod +x /usr/local/bin/bw_cache_update.sh
```
2. If that all went well, you should be able to test the script by running this command from Terminal:
```
bw_cache_update.sh
```
You should see a bunch of output. If you get any error messages, check the following:
- be sure you've set up your paths and variables in the Alfred workflow itself
- make sure you've successfully logged in ( .bwauth )
- make sure your `bw` executable is working properly

3. Final step is setting up a LaunchAgent to run this on a schedule so you never face the dreaded "spinner" when you urgently need a password. I suggest using this as a template:
```
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>Label</key>
	<string>com.lisowski-development.alfred.bw_cache_update</string>
	<key>ProgramArguments</key>
	<array>
		<string>/bin/bash</string>
		<string>--</string>
		<string>/usr/local/bin/bw_cache_update.sh</string>
	</array>
	<key>StartCalendarInterval</key>
	<dict>
		<key>Hour</key>
		<integer>8</integer>
		<key>Minute</key>
		<integer>15</integer>
	</dict>
</dict>
</plist>
```
