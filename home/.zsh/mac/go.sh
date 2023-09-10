#!/bin/sh

# Set the go base directory
export GOPATH=${HOME}/go
if [[ $(uname -p) -eq "arm" ]]; then
  export GOROOT=/opt/homebrew/opt/go/libexec/
else
  export GOROOT=/usr/local/opt/go/libexec
fi

# Add the go tools to PATH
export PATH=${PATH}:${GOPATH}/bin
