![](/sync.png)
## bw-cache-update
#### _a companion for https://github.com/blacs30/bitwarden-alfred-workflow_

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
#### Set up a LaunchAgent to run this on a schedule so you never face the dreaded "spinner" when you urgently need a password. I provide a template that runs daily at 8:15am, but you can customize as needed:
```

```
