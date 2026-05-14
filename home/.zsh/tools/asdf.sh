#!/usr/bin/env zsh

export PATH=${PATH}:${HOME}/.asdf/shims
[[ $platform == mac ]] && export KERL_BUILD_DOCS=yes
