#!/bin/sh

#export SKIM_DEFAULT_COMMAND=
export SKIM_DEFAULT_OPTIONS='--ansi --regex --delimiter ":" --prompt ">>> " --cmd-prompt "==> "'

# Function to do fuzzy search for filename
function ski() {
  mvim --remote-tab-silent $(sk -m)
}

# Function to do fuzzy search of file contents
function skag() {
  mvim --remote-tab-silent $(sk -i -c 'rg --color=always --line-number "{}"' | awk -F: '{print " +" $2 " " $1 }')
}
