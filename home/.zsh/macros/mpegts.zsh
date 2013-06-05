#!/usr/bin/env zsh

#####################################
# Function to decode the pts of the first filtered packet packet
function first_packet() {
  ffprobe -i $2 -sexagesimal -pretty -show_packets -print_format compact 2>$1 >/dev/null | grep "$1" | sed -n 1p
}

#####################################
# Function to decode the pts of the first filtered packet packet
function first_pts() {

  local PTS=$(first_packet $1 $2 | awk -F"|" '{print $4}')

  echo ${PTS#*pts=}
}

#####################################
# Function to decode the pts of the first audio packet
function first_audio_pts() {
  echo $1 - $(first_pts 'audio' $1)
}

#####################################
# Function to decode the pts of the first video packet
function first_video_pts() {
  echo $1 - $(first_pts 'video' $1)
}

