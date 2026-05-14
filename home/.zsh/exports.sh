#!/usr/bin/env zsh

export PYTHONSTARTUP=$HOME/.python/startup.py
export GPG_TTY=$(tty)
export HISTSIZE=4096
export LESS='-m'
export GITHUB_REPOS="$HOME/Documents/repos"
export PERL5LIB=$HOME/perl5/lib/perl5

if [ -n "$TMUX" ]; then
  export EDITOR='nvim'
else
  export EDITOR='neovide'
fi
alias vim='nvim'

GREP_OPTIONS="--exclude=.git --exclude=.svn"
export GREP_OPTIONS

export COWPATH=~/.cowsay

if [[ $platform == mac ]]; then
  export TCLLIBPATH="/usr/local/lib"
  export JAVA_HOME=$(/usr/libexec/java_home)
  if [[ $(uname -m) == "arm64" ]]; then
    export POWERLINE_DIR=/opt/homebrew/lib/python3.11/site-packages/powerline
  else
    export POWERLINE_DIR=/usr/local/lib/python3.11/site-packages/powerline
  fi
  PERL_LOCAL_LIB_ROOT="/Users/kevinkirkup/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT
  PERL_MB_OPT="--install_base \"/Users/kevinkirkup/perl5\""; export PERL_MB_OPT
  PERL_MM_OPT="INSTALL_BASE=/Users/kevinkirkup/perl5"; export PERL_MM_OPT
else
  export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
  export PATH=$PATH:/usr/lib/jvm/java-17-openjdk-amd64/bin
  export POWERLINE_DIR=/opt/anaconda3/lib/python3.11/site-packages/powerline
  PERL_LOCAL_LIB_ROOT="/home/kevinkirkup/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT
  PERL_MB_OPT="--install_base \"/home/kevinkirkup/perl5\""; export PERL_MB_OPT
  PERL_MM_OPT="INSTALL_BASE=/home/kevinkirkup/perl5"; export PERL_MM_OPT
fi

export POWERLINE_NO_ZSH_TMUX_SUPPORT="YES"
export POWERLINE_NO_ZSH_PROMPT="YES"

setopt CORRECT CORRECT_ALL
setopt auto_cd
setopt histappend
setopt histignoredups
setopt prompt_subst
setopt auto_pushd
export dirstacksize=5
