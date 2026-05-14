#!/usr/bin/env zsh

alias curl='noglob curl'
alias vim='nvim'
alias less='less -R'
alias pp='ps auxf | pager'

alias l='eza -lCF --color=auto'
alias ll='eza -laF --color=auto'
alias ls='eza -F --color=auto'
alias lsp='eza -F | less'

alias tail='grc tail'
alias nmap='grc nmap'
alias ps='grc ps'
alias ifconfig='grc ifconfig'
alias dig='grc dig'
alias fdisk='grc fdisk'

alias l_math='zmodload zsh/mathfunc'
alias l_socket='zmodload zsh/net/socket'

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
