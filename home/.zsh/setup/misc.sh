#!/usr/bin/env zsh

############################################################
# ZSH alias
############################################################
alias l_math='zmodload zsh/mathfunc'
alias l_socket='zmodload zsh/net/socket'

# --------------------------------------------------
# Misc aliases
# --------------------------------------------------
alias less='less -R'
alias pp='ps auxf | pager'

############################################################
# List directories in lexicographical order
# Most recent/oldest modified first
function lt { ls -1trsa "$@" | tail; }

############################################################
# Function to grep the list of precesses
function psgrep() { ps auxf | grep -v grep | grep "$@" -i --color=auto; }

############################################################
# Find file with name
function fname() { find . -iname "*$@*"; }

############################################################
# Remove lines from $1 if the appear in $2
function remove_lines_from { grep -F -x -v -f $2 $1; }

############################################################
# Create a directory and move to it
function mcd() { mkdir $1 && cd $1; }

############################################################
# Function to grep the command history
function grep_history()
{
  if [ ! -z "$1" ] ; then
    history | grep "$1" | grep -v histg
  else
    echo "Need a command to grep history for..."
  fi

}
alias histg='grep_history'

############################################################
# Function to extract archives
function extract() {
     case $1 in
       *.tar.bz2) tar xjvf "$1" ;;
       *.tar.gz)  tar xvzf "$1" ;;
       *.bz2)     bunzip2 "$1" ;;
       *.gz)      gunzip "$1"  ;;
       *.tar)     tar xvf "$1" ;;
       *.tbz2)    tar xjvf "$1" ;;
       *.tgz)     tar xzvf "$1" ;;
       *.zip)     unzip "$1" ;;
       *.7z)      7z x "$1" ;;
       *.rar)     unrar e "$1" ;;
       *.jar)     unzip "$1" ;;
       *.apk)     unzip "$1" ;;
       *.Z)       uncompress "$1" ;;
       *.rpm)     rpm2cpio.pl "$1" | cpio -idmv ;;
       *)       echo "'$1' unknown compression type" ;;
     esac
}

# Create a 32 bit random password salt
function create_salt() {
  python -c 'import os, binascii; print binascii.hexlify(os.urandom(32))'
}

# Encrypt the password using the password to encrypt and the salt
function help_encrypt() {
  echo python -c 'import crypt; print crypt.crypt("This is my Password", "$1$SomeSalt$")'
}

# Create an SSL Certificate
function create_ssl_certificates() {
  openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout $1.key -out $1.crt
}

# Pipe output through GRC for color coding
alias tail='grc tail'
alias nmap='grc nmap'
alias ps='grc ps'
alias ifconfig='grc ifconfig'
alias dig='grc dig'
alias fdisk='grc fdisk'

# Function to convert a JSON document in to a YAML document
function json2yaml() {

  local JSON_FILE=$1
  local YAML_FILE="${JSON_FILE%.json}.yml"

  python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < ${JSON_FILE} > ${YAML_FILE}
}

# Function to convert a YAML document in to a JSON document
function yaml2json() {

  local YAML_FILE=$1
  local JSON_FILE="${YAML_FILE%.*}.json"

  python -c 'import sys, yaml, json; json.dump(yaml.safe_load(sys.stdin), sys.stdout, indent=4)' < ${YAML_FILE} > ${JSON_FILE}
}

function timestamp() {

  local BUILD_DATE=$(date -u +%FT%T)
  echo $BUILD_DATE | sed 's/[T:-]//g'
}

# --------------------------------------------------
# Highlight & Formatting
# --------------------------------------------------

# LS Scripts
alias l='eza -lCF --color=auto'
alias ll='eza -laF --color=auto'
alias ls='eza -F --color=auto'
alias lsp='eza -F | less'

# Use bat for MANPAGER
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

