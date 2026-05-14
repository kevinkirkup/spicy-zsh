#!/bin/zsh

CASE_SENSITIVE="true"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

platform='unknown'
[[ $(uname) == 'Linux' ]]  && platform='linux'
[[ $(uname) == 'Darwin' ]] && platform='mac'
export platform
export ARCHFLAGS="-arch $(uname -m)"

source ~/.zsh/omz.sh
source ~/.zsh/path.sh
source ~/.zsh/exports.sh
source ~/.zsh/aliases.sh
source ~/.zsh/functions.sh

for f in ~/.zsh/tools/*.sh; do source "$f"; done

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# LM Studio CLI
export PATH="$PATH:/Users/kevinkirkup/.cache/lm-studio/bin"
export PATH="$PATH:/Users/kevinkirkup/.lmstudio/bin"
