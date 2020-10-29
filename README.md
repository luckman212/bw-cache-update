![](/sync.png)
## bw-cache-update
#### _a companion for https://github.com/blacs30/bitwarden-alfred-workflow so you never face the dreaded "spinner" when you urgently need a password_

## Install

#### Copy the entire line below (triple-click) and paste it into a Terminal window (this assumes you have `/usr/local/bin` in your `$PATH`):

```
curl -o /usr/local/bin/bw_cache_update.sh https://raw.githubusercontent.com/luckman212/bw-cache-update/main/bw_cache_update.sh && chmod +x /usr/local/bin/bw_cache_update.sh
```
## Run
#### Test the script by running this command from Terminal:
```
bw_cache_update.sh
```
If you get a dialog about access, click OK:

![](/access.png)

You should see a bunch of output. If you get any error messages, check the following:
- be sure you've set up your paths and variables in the Alfred workflow itself (e.g.`PATH` and `BW_EXEC`)
- make sure you're successfully logged in / authenticated ( .bwauth )
- make sure your `bw` CLI is installed & working properly (https://github.com/bitwarden/cli#downloadinstall)

## Automate
#### Set up a LaunchAgent so it runs on a schedule. I provide a template that runs daily at 8:15am, but you can customize as needed. Again, copy the entire line below and paste it into a Terminal window: 
```
curl -o ~/Library/LaunchAgents/bw-cache-update-agent.plist https://raw.githubusercontent.com/luckman212/bw-cache-update/main/bw-cache-update-agent.plist && chmod 644 ~/Library/LaunchAgents/bw-cache-update-agent.plist && launchctl load ~/Library/LaunchAgents/bw-cache-update-agent.plist
```

#### Discussion: https://github.com/blacs30/bitwarden-alfred-workflow/issues/49
