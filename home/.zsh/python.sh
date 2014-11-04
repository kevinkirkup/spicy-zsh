#!/usr/local/env zsh

# PIP Aliases

alias servethis='python -m SimpleHTTPServer 8080'
alias ipn='ipython notebook --pylab inline'

# URL encode a string
#
# Example:
# $ urlencode 'q werty=/;'
# q+werty%3D%2F%3B
#
alias urlencode='python -c "import sys, urllib as ul; print ul.quote_plus(sys.argv[1])"'
