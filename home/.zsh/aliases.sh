#!/usr/bin/env zsh
#
# All shell aliases. Platform-specific aliases are grouped at the bottom
# under an inline [[ $platform == mac ]] guard. Tool-specific aliases
# (docker, git, ansible, etc.) live in their respective tools/*.sh files.

# General
alias curl='noglob curl'
alias vim='nvim'
alias less='less -R'
alias pp='ps auxf | pager'

# Listing (eza)
alias l='eza -lCF --color=auto'
alias ll='eza -laF --color=auto'
alias ls='eza -F --color=auto'
alias lsp='eza -F | less'

# GRC colorized output
alias tail='grc tail'
alias nmap='grc nmap'
alias ps='grc ps'
alias ifconfig='grc ifconfig'
alias dig='grc dig'
alias fdisk='grc fdisk'

# Lazy-load ZSH math and socket modules
alias l_math='zmodload zsh/mathfunc'
alias l_socket='zmodload zsh/net/socket'

# Platform-specific
if [[ $platform == mac ]]; then
  alias cat='/opt/homebrew/bin/bat'
  alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'
  alias calm='/usr/bin/cal $(date "+%m %Y")'
  alias usbtree='system_profiler SPUSBDataType'
  alias keyboardmaestro='/Applications/Keyboard\ Maestro.app/Contents/MacOS/keyboardmaestro'
else
  alias cat='/usr/bin/batcat'
  alias bat='/usr/bin/batcat'
fi
