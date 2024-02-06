#!/bin/zsh

# ----------------------------------------
# Additional path
# ----------------------------------------
if [[ $(uname -m) -eq "arm64" ]]; then
  export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:
  export PATH=$PATH:/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:
else
  export PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin:
fi
export PATH=$PATH:$HOME/bin

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ $(uname -m) -eq "arm64" ]]; then
  __conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/opt/homebrew/anaconda3/bin:$PATH"
      fi
  fi
else
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
fi
unset __conda_setup
# <<< conda initialize <<<

# ----------------------------------------
# Powerline
# ----------------------------------------
if [[ $(uname -m) -eq "arm64" ]]; then
  export POWERLINE_DIR=/opt/homebrew/lib/python3.11/site-packages/powerline
else
  export POWERLINE_DIR=/usr/local/lib/python3.11/site-packages/powerline
fi

export PATH=$PATH:$HOME/.local/bin

# Source powerline status bar
export POWERLINE_NO_ZSH_TMUX_SUPPORT="YES"
export POWERLINE_NO_ZSH_PROMPT="YES"

# Make sure the powerline daemon is running
powerline-daemon -q
source ${POWERLINE_DIR}/bindings/zsh/powerline.zsh
