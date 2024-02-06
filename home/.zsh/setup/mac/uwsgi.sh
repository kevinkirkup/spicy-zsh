#!/usr/bin/env zsh

# Ngnix control
function uwsgictl {

  if [[ $1 == "reload" ]]; then
    echo "Unloading uWSGI..."
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist
    wait
    echo "Loading uWSGI..."
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist

  elif [[ $1 == "unload" ]]; then
    echo "Unloading uWSGI..."
    sudo launchctl unload -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist

  elif [[ $1 == "load" ]]; then
    echo "Unloading uWSGI..."
    sudo launchctl load -w /Library/LaunchDaemons/homebrew.mxcl.uwsgi.plist

  else
    echo "Command $1 unsupported"

  fi
}
