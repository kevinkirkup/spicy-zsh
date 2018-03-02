#!/usr/bin/env zsh

export ANSIBLE_COW_SELECTION=owl

# Provision the entire site
alias ap='ansible-playbook site.yml --ask-sudo'
