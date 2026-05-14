#!/usr/bin/env zsh
[[ -f ${POWERLINE_DIR}/bindings/zsh/powerline.zsh ]] || return
powerline-daemon -q
source ${POWERLINE_DIR}/bindings/zsh/powerline.zsh
