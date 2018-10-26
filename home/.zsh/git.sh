#!/usr/bin/env zsh

##################################################
# Function to generate a git tag with timestamp
##################################################
function gen_tag() {

  BUILD_DATE=$(date -u +%FT%T)

  IMAGE_VERSION=$(echo $BUILD_DATE | sed 's/[T:-]//g')

  IMAGE_TAG="${IMAGE_VERSION}-"

  echo $IMAGE_TAG
}
