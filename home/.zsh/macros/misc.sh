#!/usr/bin/env zsh

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
       *)       echo "'$1' unknown compression type" ;;
     esac
}
