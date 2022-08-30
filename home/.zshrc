
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
export ARCHFLAGS="-arch x86_64"

# ----------------------------------------
# Additional path
# ----------------------------------------
export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:
export PATH=$PATH:$HOME/bin

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
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

export LESS='-m'

# ----------------------------------------
# Perl settings
# ----------------------------------------
export PERL5LIB=$HOME/perl5/lib/perl5

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
# Local configurations
############################################################
export GITHUB_REPOS="$HOME/Documents/repos"

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

# --------------------------------------------------
# Iterm 2 Shell integration
# --------------------------------------------------
#test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

eval "$(starship init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/kevinkirkup/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/kevinkirkup/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/kevinkirkup/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/kevinkirkup/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# ----------------------------------------
# Powerline
# ----------------------------------------
export POWERLINE_DIR=/usr/local/lib/python3.8/site-packages/powerline

# Source powerline status bar
export POWERLINE_NO_ZSH_TMUX_SUPPORT="YES"
export POWERLINE_NO_ZSH_PROMPT="YES"

export PATH=$PATH:$HOME/.local/bin

# Make sure the powerline daemon is running
powerline-daemon -q
source ${POWERLINE_DIR}/bindings/zsh/powerline.zsh
