#!/usr/bin/env sh

# Source jira autocomplete
eval "$(jira --completion-script-zsh)"

alias jl='jira list -n'
alias jt='jira take'
alias je='jira edit'
