#!/usr/bin/env zsh
[[ $platform != mac ]] && return
function cleanup_nvim() {
  rm -rf ~/.cache/nvim
  rm -rf ~/.local/share/nvim
  rm -rf ~/.local/state/nvim
}
