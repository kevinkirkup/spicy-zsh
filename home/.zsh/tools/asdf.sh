#!/usr/bin/env zsh

[[ $platform == mac ]] && export PATH=${PATH}:${HOME}/.asdf/shims
[[ $platform == mac ]] && export KERL_BUILD_DOCS=yes
