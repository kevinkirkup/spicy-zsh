#!/usr/bin/env zsh

############################################################
# Function to generate localizations for XCode
function localize_project() {
  find . -name \*.m | xargs genstrings -o en.lproj
  find . -name \*.xib | xargs -t -I '{}' ibtool --generate-strings '{}'.strings '{}'
}

############################################################
# Show workspace settings
function build_settings() {

  local PROJECT_NAME=$1
  local TARGET=$2

  if [ -z "$TARGET" ]; then
    TARGET=$PROJECT_NAME
  fi

  xcodebuild -project ${PROJECT_NAME}.xcodeproj -target "${TARGET}" -showBuildSettings
}
