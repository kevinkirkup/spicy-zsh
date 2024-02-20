#!/bin/zsh

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
  wd
  web-search
  grc
  nmap
  sudo
  tmux tmuxinator
  docker docker-compose # docker-machine boot2docker
  kubectl # oc helm kops
  gnu-utils vi-mode colorize extract encode64
  git-flow github gitignore git-extras tig gitfast git-prompt
  # golang
  rust
  ssh-agent
  # bundler gem rake ruby rbenv
  mix mix-fast rebar
  python pyenv pylint pip autopep8 celery poetry # virtualenv
  jsontools
  postgres
  # node npm
  # bower grunt
  # vagrant
  yum
  ansible
  terraform 
)

# ----------------------------------------------------------
# asdf setup
# ----------------------------------------------------------
. "$HOME/.asdf/asdf.sh"

# ----------------------------------------------------------
# Oh-my-ZSH setup
# ----------------------------------------------------------
zstyle ':omz:update' mode reminder
zstyle ':omz:update' frequency 7

source $ZSH/oh-my-zsh.sh

# ----------------------------------------------------------
# Prompt
# ----------------------------------------------------------
#export RPROMPT='%B%F{208}%n%f%{$fg_bold[white]%}@%F{039}%m%f%{$reset_color%}-%D{%c}'
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

# Set the prompt.
RPROMPT='$(git_super_status)'
PROMPT='%{$fg_bold[blue]%}%F{208}%c%f %{$fg_bold[white]%}%# %{$reset_color%}'

# ----------------------------------------
# SSH-Agent configuration settings
# ----------------------------------------
zstyle :omz:plugins:ssh-agent identities id_rsa
zstyle :omz:plugins:ssh-agent lifetime 30m

############################################################
# Helper functions
############################################################

# ----------------------------------------
# Linux Java settings
# ----------------------------------------
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export PATH=$PATH:/usr/lib/jvm/java-17-openjdk-amd64/bin

# ----------------------------------------
# Perl library path
# ----------------------------------------
PATH="/home/kevinkirkup/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/kevinkirkup/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/kevinkirkup/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/kevinkirkup/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/kevinkirkup/perl5"; export PERL_MM_OPT;

# ----------------------------------------
# Powerline
# ----------------------------------------
export POWERLINE_DIR=/home/kevinkirkup/.local/lib/python2.7/site-packages/powerline

export PATH=$PATH:$HOME/.local/bin

# --------------------------------------------------
# Highlight & Formatting
# --------------------------------------------------
alias cat='/usr/bin/batcat'
alias bat='/usr/bin/batcat'
