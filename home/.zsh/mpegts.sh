#!/usr/bin/env zsh

#####################################
# Function to decode the pts of the first filtered packet packet
function first_packet() {
  ffprobe -i $2 -sexagesimal -pretty -show_packets -print_format compact 2>&1 >/dev/null | grep "$1" | sed -n 1p
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

############################################################
# Function to demux the raw AAC audio from the specified TS files
function demux_aac() {

  if [[ -z $* ]]; then
    echo Specify glob of TS segments
    return 1
  fi

  echo Value "$*"

  for i ($*)
    `ffmpeg -i $i -codec:a copy ${i%.ts}.aac`
}

############################################################
# Function to demux the raw AAC audio from the specified TS files
function demux_hls_aac() {

  if [[ -z $* ]]; then
    echo Specify glob of TS segments
    return 1
  fi

  echo Value "$*"

  for i ($*) {

    # Extract the audio
    `ffmpeg -i $i -codec:a copy ${i%.ts}.aac`

    # Get the PTS for the first audio packet
    local AUDIO_PTS=$(first_pts 'audio' $i)

    # Prepend the ID3 Tag with the AUDIO PTS
    `add_audio_id3.py ${i%.ts}.aac $AUDIO_PTS`
  }
}

############################################################
# Function to remove the audio from the specified TS Files
function remove_audio() {

  if [[ -z $* ]]; then
    echo Specify glob of TS segments
    return 1
  fi

  echo Value "$*"

  for i ($*)
    `ffmpeg -i $i -map 0:0 -c:v copy ${i%.ts}_noAudio.ts`
}
