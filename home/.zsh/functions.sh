#!/usr/bin/env zsh
#
# General utility functions. Tool-specific functions (docker, fzf, git, etc.)
# live in their respective tools/*.sh files. Mac-only functions are grouped
# at the bottom under an inline [[ $platform == mac ]] guard.

# ----------------------------------------------------------
# Filesystem
# ----------------------------------------------------------
function lt { ls -1trsa "$@" | tail; }
function fname() { find . -iname "*$@*"; }
function mcd() { mkdir $1 && cd $1; }
function remove_lines_from { grep -F -x -v -f $2 $1; }

# ----------------------------------------------------------
# Process inspection
# ----------------------------------------------------------
function psgrep() { ps auxf | grep -v grep | grep "$@" -i --color=auto; }
function killit() {
  ps aux | grep -v "grep" | grep "$@" | awk '{print $2}' | xargs sudo kill
}

# ----------------------------------------------------------
# History
# ----------------------------------------------------------
function grep_history() {
  if [ ! -z "$1" ]; then
    history | grep "$1" | grep -v histg
  else
    echo "Need a command to grep history for..."
  fi
}
alias histg='grep_history'

# ----------------------------------------------------------
# Security / certificates
# ----------------------------------------------------------
function create_ssl_certificates() {
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $1.key -out $1.crt
}

# ----------------------------------------------------------
# Data conversion
# ----------------------------------------------------------
function json2yaml() {
  local JSON_FILE=$1
  local YAML_FILE="${JSON_FILE%.json}.yml"
  python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < ${JSON_FILE} > ${YAML_FILE}
}

function yaml2json() {
  local YAML_FILE=$1
  local JSON_FILE="${YAML_FILE%.*}.json"
  python -c 'import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout, indent=4)' < ${YAML_FILE} > ${JSON_FILE}
}

function timestamp() {
  local BUILD_DATE=$(date -u +%FT%T)
  echo $BUILD_DATE | sed 's/[T:-]//g'
}

# ----------------------------------------------------------
# Mac-only
# ----------------------------------------------------------
if [[ $platform == mac ]]; then
  function enable_preview_selection() {
    defaults write com.apple.finder QLEnableTextSelection -bool TRUE
    killall Finder
  }

  function interface_ip4() {
    ifconfig $1 inet | awk 'NR>1 { print $2 }'
  }
fi

if [ -z "$TMUX" ]; then
  if [ -d $COWPATH ]; then
    COW=$(ls $COWPATH/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')
  else
    COW=$(ls /usr/local/share/cows/* | awk 'BEGIN { srand() } rand() >=0.5 { print; exit }')
  fi
  fortune | cowsay -f $COW
fi
