#!/usr/bin/env zsh

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sporty_256"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

plugins=(
  wd web-search
  sudo
  tmux tmuxinator
  docker docker-compose kubectl oc
  gnu-utils vi-mode colorize extract encode64
  git git-flow github gitignore git-extras gitfast tig
  go golang
  ssh-agent
  bundler gem rake ruby rbenv
  python pyenv pylint pip autopep8 celery virtualenv
  postgres
  node npm
  coffee cake bower grunt
  vagrant
  yum
)

source $ZSH/oh-my-zsh.sh

# ----------------------------------------
# Linux Java settings
# ----------------------------------------
export JAVA_HOME=/opt/jdk/jdk1.8.0_20
export PATH=$PATH:/opt/jdk/jdk1.8.0_20/bin

# ----------------------------------------
# SSH-Agent configuration settings
# ----------------------------------------
zstyle :omz:plugins:ssh-agent identities id_rsa
zstyle :omz:plugins:ssh-agent lifetime 30m

# ----------------------------------------
# Powerline
# ----------------------------------------
export POWERLINE_DIR=/home/kkirkup/.local/lib/python2.7/site-packages/powerline

# Source powerline status bar
export POWERLINE_NO_ZSH_TMUX_SUPPORT="YES"
export POWERLINE_NO_ZSH_PROMPT="YES"

export PATH=$PATH:$HOME/.local/bin

# Make sure the powerline daemon is running
powerline-daemon -q
source ${POWERLINE_DIR}/bindings/zsh/powerline.zsh
#
# ----------------------------------------
# Alias
# ----------------------------------------

# LS Scripts
alias l='ls -lCF --color=auto'
alias ll='ls -laF --color=auto'
alias ls='ls -F --color=auto'
alias lsp='ls -F | less'
