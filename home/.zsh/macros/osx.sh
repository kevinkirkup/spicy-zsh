#!/usr/bin/env zsh

############################################################
# Function to extract archives
function localize_project() {
  find . -name \*.m | xargs genstrings -o en.lproj
  find . -name \*.xib | xargs -t -I '{}' ibtool --generate-strings '{}'.strings '{}'
}
