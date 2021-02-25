#!/usr/bin/env zsh

# --------------------------------------------------
# Enable IEX history
# --------------------------------------------------
export ERL_AFLAGS="-kernel shell_history enabled"

# Compile mix before running command line
alias iexm=iex -S mix
