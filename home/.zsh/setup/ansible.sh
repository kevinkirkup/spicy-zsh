#!/usr/bin/env zsh

export ANSIBLE_COW_SELECTION=owl

# Provision the entire site
alias ap='ansible-playbook site.yml --ask-sudo'

# Function to validate ansible roles using the python package
# ansible-review. NOTE! You'll need install ansible-review with pip
function validate_ansible_roles() {
  find roles -type f | xargs ansible-review -c ansible-review/config.ini
}
