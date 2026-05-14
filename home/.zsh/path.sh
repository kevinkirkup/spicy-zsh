#!/usr/bin/env zsh

if [[ $platform == mac ]]; then
  if [[ $(uname -m) == "arm64" ]]; then
    export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
  fi
  export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:$PATH
  export PATH=$PATH:/Developer/usr/bin
  export PATH=$PATH:${HOME}/Library/Python/2.7/bin
  export PATH=$PATH:${HOME}/Library/Python/3.10/bin
  export PATH=/opt/homebrew/opt/postgresql@17/bin:$PATH
  PATH="/Users/kevinkirkup/perl5/bin${PATH:+:${PATH}}"; export PATH
else
  export PATH=$PATH:/opt/games
  export PATH=$PATH:/usr/lib/jvm/java-17-openjdk-amd64/bin
  PATH="/home/kevinkirkup/perl5/bin${PATH:+:${PATH}}"; export PATH
fi

export PATH=$PATH:$HOME/shared/bin
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/.local/bin
