#!/usr/bin/env zsh

# ZSH alias
alias l_math='zmodload zsh/mathfunc'
alias l_socket='zmodload zsh/net/socket'

# Misc aliases

# Less alias
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
       *.rpm)      rpm2cpio.pl "$1" | cpio -vid ;;
       *)       echo "'$1' unknown compression type" ;;
     esac
}
