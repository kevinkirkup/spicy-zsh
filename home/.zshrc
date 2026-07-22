#!/bin/zsh
#
# Load order:
#   omz.sh      — oh-my-zsh init, plugin list, theme, prompt
#   path.sh     — all PATH additions (platform-split inline)
#   exports.sh  — env vars, ZSH options (setopt)
#   aliases.sh  — all aliases (platform-split inline)
#   functions.sh — general utility functions
#   tools/*.sh  — one file per external tool, sourced alphabetically
#   .zshrc.local — machine-local overrides (gitignored)

platform='unknown'
[[ $(uname) == 'Linux' ]]  && platform='linux'
[[ $(uname) == 'Darwin' ]] && platform='mac'
export platform

source ~/.zsh/omz.sh
source ~/.zsh/path.sh
source ~/.zsh/exports.sh
source ~/.zsh/aliases.sh
source ~/.zsh/functions.sh

for f in ~/.zsh/tools/*.sh; do source "$f"; done

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local


# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/kevinkirkup/.lmstudio/bin"
# End of LM Studio CLI section

