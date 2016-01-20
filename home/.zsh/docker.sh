#!/usr/bin/env zsh

# Docker related alias' and functions

alias dls='docker ps -a'
alias di='docker images'

alias dci='docker rmi $(docker images -f dangling=true -q)
alias dcc='docker rm $(docker ps -qa)
alias din='docker inspect'
