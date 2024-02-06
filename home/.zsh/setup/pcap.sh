#!/usr/bin/env zsh

# Function to convert to libpcap format
function pcap_convert() {

  # Make sure a file was specified
  if [ -f $1 ] ; then

    case $1 in
      *.pngng)  editcap $1 ${1%%\.*}.pcap ;;
      *)        echo "'$1' cannot be converted to libpcap format"
    esac

  else
    echo "'$1' is not a valid file"
  fi

}
