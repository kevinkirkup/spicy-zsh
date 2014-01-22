#!/usr/bin/env zsh

############################################################
# Function to extract archives
function enable_preview_selection() {
  defaults write com.apple.finder QLEnableTextSelection -bool TRUE
  killall Finder
}
