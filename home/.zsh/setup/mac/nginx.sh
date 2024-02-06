#!/usr/bin/env zsh

# Ngnix control
function nginxctl {

  if [[ $1 == "reload" ]]; then
    echo "Unloading Nginx..."
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist
    wait
    echo "Loading Nginx..."
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

  elif [[ $1 == "unload" ]]; then
    echo "Unloading Nginx..."
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

  elif [[ $1 == "load" ]]; then
    echo "Unloading Nginx..."
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.nginx.plist

  else
    echo "Command $1 unsupported"

  fi
}
