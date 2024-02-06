#!/bin/zsh

# ----------------------------------------
# Additional path
# ----------------------------------------
export PATH=$PATH:$HOME/bin:/opt/games:

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!

# If we had to install somewhere else due to home directory encryption
if [ -d "/opt/anaconda3" ]; then
    __conda_setup="$('/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__conda_setup"
    else
        if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
            . "/opt/anaconda3/etc/profile.d/conda.sh"
        else
            export PATH="/opt/anaconda3/bin:$PATH"
        fi
    fi

# Standard installation path
else
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
fi
unset __conda_setup
# <<< conda initialize <<<

# ----------------------------------------
# Powerline
# ----------------------------------------
export POWERLINE_DIR=/opt/anaconda3/lib/python3.11/site-packages/powerline

export PATH=$PATH:$HOME/.local/bin

# Source powerline status bar
export POWERLINE_NO_ZSH_TMUX_SUPPORT="YES"
export POWERLINE_NO_ZSH_PROMPT="YES"

# Make sure the powerline daemon is running
powerline-daemon -q
source ${POWERLINE_DIR}/bindings/zsh/powerline.zsh
