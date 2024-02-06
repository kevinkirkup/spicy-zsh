#!/usr/bin/env zsh

# ----------------------------------------
# Vagrant setup
# ----------------------------------------
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# Vagrant alias' and functions

alias vu='vagrant up && vagrant ssh'
alias vd='vagrant suspend'
alias vp='vagrant provision'
