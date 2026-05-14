#!/usr/bin/env zsh

function print_h264_video_slices() {
  ffprobe -i $1 -show_frames -print_format compact 2>&1 >/dev/null |grep "media_type=video"
}

#####################################
# Function to print out the H.264 frame order
function print_h264_slice_types() {

  for frame in $(print_h264_video_slices $1); do

    local is_keyframe=`echo $frame | awk -F"|" '{print $3}'`
    local slice_type=`echo $frame | awk -F"|" '{print $18}'`

    echo -n ${slice_type#*pict_type=}

  done
}
