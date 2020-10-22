![](/sync.png)
## bw-cache-update
#### _a companion for https://github.com/blacs30/bitwarden-alfred-workflow so you never face the dreaded "spinner" when you urgently need a password.

## Install

#### Copy the entire line below (triple-click) and paste it into a Terminal window: 

```
curl -o /usr/local/bin/bw_cache_update.sh https://raw.githubusercontent.com/luckman212/bw-cache-update/main/bw_cache_update.sh && chmod +x /usr/local/bin/bw_cache_update.sh
```
## Run
#### Test the script by running this command from Terminal:
```
bw_cache_update.sh
```
You should see a bunch of output. If you get any error messages, check the following:
- be sure you've set up your paths and variables in the Alfred workflow itself
- make sure you've successfully logged in ( .bwauth )
- make sure your `bw` executable is working properly

## Automate
#### Set up a LaunchAgent so it runs on a schedule. I provide a template that runs daily at 8:15am, but you can customize as needed. Again, copy the entire line below and paste it into a Terminal window: 
```
curl -o ~/Library/LaunchAgents/bw-cache-update-agent.plist https://raw.githubusercontent.com/luckman212/bw-cache-update/main/bw-cache-update-agent.plist &&   chmod 644 ~/Library/LaunchAgents/bw-cache-update-agent.plist && launchctl load ~/Library/LaunchAgents/bw-cache-update-agent.plist
```
