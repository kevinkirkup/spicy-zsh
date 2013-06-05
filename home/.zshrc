# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="sporty_256"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

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
plugins=(git npm brew bundler gem github git-flow gnu-utils osx rails3 rake ruby rvm textmate vi-mode)

source $ZSH/oh-my-zsh.sh

# Set architecture flags
export ARCHFLAGS="-arch x86_64"

# Customize to your needs...
export PATH=/usr/local/share/python:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

############################################################
# Aliases
############################################################
# Source all alias files
for file in $HOME/.zsh/aliases/*.alias; do
     source $file
done

############################################################
# Functions
############################################################
for file in $HOME/.zsh/macros/*.sh; do
     source $file
done

# ----------------------------------------
# RVM
# ----------------------------------------
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# ----------------------------------------
# Python
# ----------------------------------------
export PYTHONSTARTUP=$HOME/.python/startup.py

# ----------------------------------------
export TERM="xterm-256color"
export EMAIL=kevin.kirkup@gmail.com

# ----------------------------------------
# Set vi editing mode
# ----------------------------------------
set -o vi

# ----------------------------------------
# Export the default editor
# ----------------------------------------
export EDITOR='mate -w'
export LESS='-m'

# ----------------------------------------
# Additional path
# ----------------------------------------
export PATH=$HOME/Dropbox/bin:$PATH:/Developer/usr/bin

# ----------------------------------------
# Ruby settings
# ----------------------------------------
#JRUBY_PATH=/usr/lib/jruby1.0/bin
#export RUBYOPT=rubygems
#export PATH=$PATH:$HOME/.gem/ruby/1.8/bin

# ----------------------------------------
# CDETS Settings
# ----------------------------------------
export CDETS_JAVA_HOME=/usr

# ----------------------------------------
# CCACHE Settings
# ----------------------------------------
export CCACHE_DIR=/var/cache/ccache
export CCACHE_UMASK=002
export CCACHE_NOLINK

# ----------------------------------------
# Get Vim Path
# ----------------------------------------
export VIMRUNTIME=`vim -e -T dumb --cmd 'exe "set t_cm=\<C-M>"|echo $VIMRUNTIME|quit' | tr -d '\015' `

# ----------------------------------------
# Set default options for grep
# ----------------------------------------
GREP_OPTIONS=
#GREP_OPTIONS='--color=always'

for PATTERN in .git .svn; do
  GREP_OPTIONS="$GREP_OPTIONS --exclude=$PATTERN"
done

export GREP_OPTIONS

# ----------------------------------------
# Add Homebrew to the path
# ----------------------------------------
export PATH=/usr/local/bin:$PATH

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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
