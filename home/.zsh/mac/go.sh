#!/bin/sh

# Set the go base directory
export GOPATH=${HOME}/go
export GOROOT=/usr/local/opt/go/libexec

# Add the go tools to PATH
export PATH=${PATH}:${GOPATH}/bin
