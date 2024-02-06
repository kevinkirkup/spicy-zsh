#!/usr/bin/env zsh

#export SKIM_DEFAULT_COMMAND=
export SKIM_DEFAULT_OPTIONS='--ansi --regex --delimiter ":" --prompt ">>> " --cmd-prompt "==> "'

# Function to do fuzzy search for filename
function skim_file_search() {
  vimr --remote-tab-silent $(sk -m)
}

# Function to do fuzzy search of file contents
function skim_file_content_search() {
  vimr --remote-tab-silent $(sk -i -c 'rg --color=always --line-number "{}"' | awk -F: '{print " +" $2 " " $1 }')
}

alias ski='skim_file_search'
alias skag='skim_file_content_search'
