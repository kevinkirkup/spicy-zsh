
# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Set the language
LANG="en_US.UTF-8"

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
export ARCHFLAGS="-arch x86_64"

# ----------------------------------------
# Additional path
# ----------------------------------------
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:
export PATH=$PATH:$HOME/bin

# ----------------------------------------
# General
# ----------------------------------------
export TERM="xterm-256color"

# ----------------------------------------
# Python
# ----------------------------------------
export PYTHONSTARTUP=$HOME/.python/startup.py

# ----------------------------------------
# Ruby setup
# ----------------------------------------
export PATH=$PATH:$HOME/.rbenv/bin

# ----------------------------------------
# Node.js setup
# ----------------------------------------
export NODE_PATH=/usr/local/lib/node_modules
export PATH=$PATH:$HOME/node_modules/.bin

# ----------------------------------------
# Vagrant setup
# ----------------------------------------
export VAGRANT_DEFAULT_PROVIDER=virtualbox

# ----------------------------------------
# Set vi editing mode
# ----------------------------------------
set -o vi

# ----------------------------------------
# Export the default editor
# ----------------------------------------
export EDITOR='vim -w'
export LESS='-m'

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
# Aliases & Functions
############################################################

# Platform specific
for file in $HOME/.zsh/$platform/*.sh; do
  source $file
done

# Local
for file in $HOME/.zsh/local/*.sh; do
  source $file
done

# generic
for file in $HOME/.zsh/*.sh; do
  source $file
done

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
