#!/usr/bin/env zsh
##################################################

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
  iterm2
  sudo
  tmux tmuxinator
  docker docker-compose docker-machine boot2docker
  kubectl oc helm kops
  gnu-utils vi-mode colorize extract encode64
  git-flow github gitignore git-extras tig gitfast git-prompt
  go golang
  rust cargo
  cabal
  brew osx xcode pod
  bundler gem rake ruby rbenv
  python pyenv pylint autopep8 celery
  swiftpm
  gradle
  jira
  jsontools
  postgres
  node npm
  coffee cake bower grunt
  ansible vagrant
  terraform)

source $ZSH/oh-my-zsh.sh

############################################################
# Helper functions
############################################################

# Function to enable preview selection in Finder
function enable_preview_selection() {
  defaults write com.apple.finder QLEnableTextSelection -bool TRUE
  killall Finder
}

# Function to get the IPV4 address of the specified interface
function interface_ip4() {
  ifconfig $1 inet | awk 'NR>1 { print $2 }'
}

# Kills any process that matches a regexp passed to it
function killit() {
    ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# OSX alias'

alias fixopenwith='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user'

# Terminal Calendar Alias's
alias calm='/usr/bin/cal $(date "+%m %Y")'

# List the OSX USB Device Tree
alias usbtree='system_profiler SPUSBDataType'

# ----------------------------------------
# OSX Java settings
# ----------------------------------------
export JAVA_HOME=$(/usr/libexec/java_home)


# ----------------------------------------
# Additional PATH
# ----------------------------------------

# Random Shared tools
export PATH=$PATH:$HOME/shared/bin

# Developer Tools
export PATH=$PATH:/Developer/usr/bin

# Python Tools
export PATH=$PATH:${HOME}/Library/Python/2.7/bin

#Postgres App
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

# Continuum Analytics Anaconda configuration and environment
export PATH=$PATH:${HOME}/anaconda3/bin

# ----------------------------------------
# Cowsay
# ----------------------------------------

# Show some cow love
fortune | cowsay -f $(ls /usr/local/share/cows/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')

# ----------------------------------------
# Powerline
# ----------------------------------------
export POWERLINE_DIR=/usr/local/lib/python3.7/site-packages/powerline

# Source powerline status bar
export POWERLINE_NO_ZSH_TMUX_SUPPORT="YES"
export POWERLINE_NO_ZSH_PROMPT="YES"
export RPROMPT='%B%F{208}%n%f%{$fg_bold[white]%}@%F{039}%m%f%{$reset_color%}-%D{%c}'

export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Library/Python/3.7/bin

# Make sure the powerline daemon is running
powerline-daemon -q
source ${POWERLINE_DIR}/bindings/zsh/powerline.zsh

# ----------------------------------------
# Alias
# ----------------------------------------

# LS Scripts
alias l='ls -lCFG'
alias ll='ls -laFG'
alias ls='ls -FG'
alias lsp='ls -F | less'

# ADB alias's
alias adbd='adb devices'

# Postgresql
alias pg_start='pg_ctl -D /usr/local/var/postgres start'
