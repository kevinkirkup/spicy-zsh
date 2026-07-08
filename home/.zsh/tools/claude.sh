#!/usr/bin/env zsh

export ANTHROPIC_FOUNDRY_BASE_URL=https://bletort-7313-resource.services.ai.azure.com/anthropic

if [[ "$PWD" == "$HOME/repos/work/dlr"* ]]; then
  export ANTHROPIC_DEFAULT_SONNET_MODEL='claude-sonnet-4-6-SF'
  export ANTHROPIC_DEFAULT_OPUS_MODEL='claude-opus-4-8-SF'
  export ANTHROPIC_DEFAULT_HAIKU_MODEL='claude-haiku-4-5-SF'
fi
