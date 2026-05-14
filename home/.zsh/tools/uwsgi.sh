#!/usr/bin/env zsh
[[ $platform != mac ]] && return
function uwsgictl {
  if [[ $1 == "reload" ]]; then
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist
  elif [[ $1 == "unload" ]]; then
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist
  elif [[ $1 == "load" ]]; then
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist
  else
    echo "Command $1 unsupported"
  fi
}
