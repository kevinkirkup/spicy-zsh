#!/bin/zsh

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Set the language
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

#--------------------------------------------------
# Get the platform
#--------------------------------------------------
platform="unknown"
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'

elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='mac'
fi

# Set architecture flags
export ARCHFLAGS="-arch $(uname -m)"

# ----------------------------------------
# General
# ----------------------------------------
#export TERM="xterm-256color"

# ----------------------------------------
# Python
# ----------------------------------------
export PYTHONSTARTUP=$HOME/.python/startup.py

# ----------------------------------------
# Set vi editing mode
# ----------------------------------------
set -o vi

# ----------------------------------------
# Export the default editor
# ----------------------------------------
if [ -n "$TMUX" ]; then
  export EDITOR='nvim'
else
  export EDITOR='vimr'
fi
alias vim='nvim'

export LESS='-m'

# ----------------------------------------
# Perl settings
# ----------------------------------------
export PERL5LIB=$HOME/perl5/lib/perl5

# ----------------------------------------
# Gnu PG Settings
# ----------------------------------------
export GPG_TTY=`tty`

# ----------------------------------------
# Set default options for grep
# ----------------------------------------
GREP_OPTIONS=
#GREP_OPTIONS='--color=always'

for PATTERN in .git .svn; do
  GREP_OPTIONS="$GREP_OPTIONS --exclude=$PATTERN"
done

export GREP_OPTIONS

############################################################
# Local configurations
############################################################
export GITHUB_REPOS="$HOME/Documents/repos"

############################################################
# Aliases & Functions
############################################################

# ----------------------------------------
# Turn on minor directory spellchecking for cd
# Enable command history and append the history
# ----------------------------------------
setopt CORRECT CORRECT_ALL
setopt auto_cd
setopt histappend

# --------------------------------------------------
# Ignore duplicates in the history
setopt histignoredups
export HISTSIZE=4096

# --------------------------------------------------
# Expand functions in the prompt
setopt prompt_subst

# --------------------------------------------------
# Automatically pushd
setopt auto_pushd
export dirstacksize=5

# --------------------------------------------------
# Extended Globing
# setopt EXTENDED_GLOB

# --------------------------------------------------
# CD Movements from zshkit
# setopt AUTOCD
# setopt AUTOPUSHD PUSHDMINUS PUSHDTOHOME
# setopt cdablevars

# --------------------------------------------------
alias curl='noglob curl'

# Platform Pre Setup
for file in $HOME/.zsh/pre/$platform.sh; do
  source $file
done

# Platform specific
for file in $HOME/.zsh/setup/$platform/*.sh; do
  source $file
done

# Local
for file in $HOME/.zsh/setup/local/*.sh; do
  source $file
done

# generic
for file in $HOME/.zsh/setup/*.sh; do
  source $file
done

# Platform Post Setup
for file in $HOME/.zsh/post/$platform.sh; do
  source $file
done

# Starship setup
eval "$(starship init zsh)"

# ----------------------------------------
# Cowsay
# ----------------------------------------
# Path to my cowfiles
export COWPATH=~/.cowsay

# Show some cow love if we aren't in Tmux
if [ -z "$TMUX" ]; then
  if [ -d $COWPATH ]; then
    COW=$(ls $COWPATH/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')
  else
    COW=$(ls /usr/local/share/cows/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')
  fi

  fortune | cowsay -f $COW
fi

# ----------------------------------------
# Powerline
# ----------------------------------------
# Source powerline status bar
export POWERLINE_NO_ZSH_TMUX_SUPPORT="YES"
export POWERLINE_NO_ZSH_PROMPT="YES"

# Make sure the powerline daemon is running
powerline-daemon -q
source ${POWERLINE_DIR}/bindings/zsh/powerline.zsh
