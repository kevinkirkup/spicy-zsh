#!/bin/zsh

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

