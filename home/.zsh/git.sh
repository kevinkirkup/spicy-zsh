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

##################################################
# Function to clone all role repos base on the
# ansible-galaxy requirements files in the subtree
##################################################
function clone_repos() {

  # --------------------------------------------------
  # Find the Repos in the available bundles
  # --------------------------------------------------
  for repo in `cat $(find . -iname "requirements.yml"|grep "/bundle/requirements.yml") | grep src | awk -F" " '{ print $3 }' | sort| uniq`; do

    echo Updated Repo: $repo

    # --------------------------------------------------
    # If the Role Repo already exists, just update it to the latest
    # --------------------------------------------------
    if [[ -d roles/$(basename "$repo") ]]; then

      local BASE=$(pwd)

      cd roles/$(basename "$repo")
      git fetch
      git pull

      cd $BASE

    # --------------------------------------------------
    # Clone the Repo
    # --------------------------------------------------
    else
      git clone $repo roles/$(basename "$repo")
    fi

  done

}
