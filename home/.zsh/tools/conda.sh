#!/usr/bin/env zsh

if [[ $platform == mac ]]; then
  if [[ $(uname -m) == "arm64" ]]; then
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
else
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
  else
    __conda_setup="$('/home/kevinkirkup/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
    if [ $? -eq 0 ]; then
      eval "$__conda_setup"
    else
      if [ -f "/home/kevinkirkup/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kevinkirkup/anaconda3/etc/profile.d/conda.sh"
      else
        export PATH="/home/kevinkirkup/anaconda3/bin:$PATH"
      fi
    fi
  fi
fi
unset __conda_setup
