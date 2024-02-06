#!/usr/bin/env zsh

# Rust Path
export PATH=${PATH}:${HOME}/.cargo/bin

# Additional Rust alias' and helper functions

# Setup Rust repository configurations
function r_setup_repo() {
  cargo checkmate github-ci install
  cargo checkmate git-hook install
}

# Install Rust tools
function r_install_tools() {
  rustup component add clippy
  cargo install cargo-checkmate
}

