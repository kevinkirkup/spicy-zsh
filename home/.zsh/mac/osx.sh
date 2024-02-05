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
  wd
  web-search
  grc
  nmap
  brew macos xcode pod
  keychain marked2
  tmux # tmuxinator
  docker docker-compose #docker-machine boot2docker
  kubectl #oc helm kops
  gnu-utils vi-mode colorize extract encode64
  git-flow github gitignore git-extras tig gitfast git-prompt
  # golang
  rust
  # bundler gem rake ruby rbenv
  mix mix-fast rebar
  python pyenv pylint autopep8 celery poetry
  scala sbt
  # swiftpm
  # gradle
  jsontools
  postgres
  # node npm
  # bower grunt
  ansible
  terraform
)

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
# Keyboard Maestro
# ----------------------------------------
alias keyboardmaestro='/Applications/Keyboard\ Maestro.app/Contents/MacOS/keyboardmaestro'

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
export PATH=$PATH:${HOME}/Library/Python/3.10/bin

#Postgres App
export PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH

# ----------------------------------------
# TCL library path
# ----------------------------------------
export TCLLIBPATH="/usr/local/lib"

# ----------------------------------------
# Perl library path
# ----------------------------------------
PATH="/Users/kevinkirkup/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/Users/kevinkirkup/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/Users/kevinkirkup/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/Users/kevinkirkup/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/Users/kevinkirkup/perl5"; export PERL_MM_OPT;

# ----------------------------------------
# Cowsay
# ----------------------------------------
# Path to my cowfiles
export COWPATH=~/.cowsay

# Show some cow love if we aren't in Tmux
if [ -z "$TMUX" ]; then
  if [[ $(uname -p) -eq "arm" ]]; then
    COW=$(ls $COWPATH/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')
  else
    COW=$(ls /usr/local/share/cows/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')
  fi

  fortune | cowsay -f $COW
fi
