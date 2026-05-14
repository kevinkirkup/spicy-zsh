#!/usr/bin/env zsh
[[ $platform != mac ]] && return
export MODEL_DIR=$HOME/ai/models
export LLAMA_METAL=1

# LM Studio CLI
export PATH="$PATH:$HOME/.cache/lm-studio/bin"
export PATH="$PATH:$HOME/.lmstudio/bin"
