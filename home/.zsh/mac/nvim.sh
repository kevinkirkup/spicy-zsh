#!/usr/bin/env zsh

# Cleanup the Nvim environment configuration
function cleanup_nvim() {
	rm -rf ~/.cache/nvim
	rm -rf ~/.local/share/nvim
	rm -rf ~/.local/state/nvim
}
