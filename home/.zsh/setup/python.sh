#!/usr/local/env zsh

# Force color output from pytest
export PYTEST_ADDOPTS="--color=yes"

# PIP Aliases

alias servethis='python -m SimpleHTTPServer 8080'
alias ipn='ipython notebook'

# URL encode a string
#
# Example:
# $ urlencode 'q werty=/;'
# q+werty%3D%2F%3B
#
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kevinkirkup/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kevinkirkup/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kevinkirkup/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kevinkirkup/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
