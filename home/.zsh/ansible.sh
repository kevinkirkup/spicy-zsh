#!/usr/bin/env zsh

export ANSIBLE_COW_SELECTION=random

# Provision the entire site
alias ap='ansible-playbook site.yml --ask-sudo'
