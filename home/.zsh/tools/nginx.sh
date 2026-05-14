#!/usr/bin/env zsh
[[ $platform != mac ]] && return
function nginxctl {
  if [[ $1 == "reload" ]]; then
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
  elif [[ $1 == "unload" ]]; then
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
  elif [[ $1 == "load" ]]; then
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
  else
    echo "Command $1 unsupported"
  fi
}
