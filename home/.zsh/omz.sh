#!/usr/bin/env zsh

ZSH=$HOME/.oh-my-zsh
ZSH_THEME="sporty_256"

if [[ $platform == mac ]]; then
  plugins=(
    wd web-search grc nmap zoxide
    brew macos xcode pod
    keychain marked2
    tmux
    docker docker-compose
    kubectl
    gnu-utils vi-mode colorize extract encode64
    git-flow github gitignore git-extras tig gitfast git-prompt
    rust
    mix rebar
    python pylint celery poetry uv
    jsontools
    postgres
    ansible terraform
  )
else
  plugins=(
    wd web-search grc nmap sudo zoxide
    tmux tmuxinator
    docker docker-compose
    kubectl
    gnu-utils vi-mode colorize extract encode64
    git-flow github gitignore git-extras tig gitfast git-prompt
    rust
    ssh-agent
    mix mix-fast rebar
    python pyenv pylint pip autopep8 celery poetry
    jsontools
    postgres
    yum
    ansible terraform
  )
  zstyle :omz:plugins:ssh-agent identities id_rsa
  zstyle :omz:plugins:ssh-agent lifetime 30m
  . "$HOME/.asdf/asdf.sh"
fi

zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

source $ZSH/oh-my-zsh.sh

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")"
ZSH_THEME_GIT_PROMPT_SEPARATOR="|"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg_bold[blue]%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[red]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CONFLICTS="%{$fg[red]%}%{✖%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[blue]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{↓%G%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{↑%G%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{…%G%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}%{✔%G%}"
ZSH_THEME_GIT_PROMPT_CACHE="TRUE"

ZSH_TMUX_UNICODE=true

RPROMPT='$(git_super_status)'
PROMPT='%{$fg_bold[blue]%}%F{208}%c%f %{$fg_bold[white]%}%# %{$reset_color%}'
