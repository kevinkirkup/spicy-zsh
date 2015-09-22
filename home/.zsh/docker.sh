#!/usr/bin/env zsh

# Docker related alias' and functions

alias dc='docker rm `docker ps --no-trunc -aq`'
alias dls='docker ps -a'
alias di='docker images'
alias drm='docker rmi'

