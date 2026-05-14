#!/usr/bin/env zsh

export GOPATH=${HOME}/go

if [[ $platform == mac ]]; then
  if [[ $(uname -p) == "arm" ]]; then
    export GOROOT=/opt/homebrew/opt/go/libexec/
  else
    export GOROOT=/usr/local/opt/go/libexec
  fi
fi

export PATH=${PATH}:${GOPATH}/bin
