#!/usr/bin/env zsh

# Docker related alias' and functions

#alias dls='docker ps -a'
#alias dci='docker rmi $(docker images -f dangling=true -q)'
#alias dcc='docker rm $(docker ps -qa)'
#alias din='docker inspect'


# Function to launch a docker image in interactive mode
# Remove the image when we are done
function docker_interactive_remove() {

  local IMAGE=$1
  docker run --rm -it $IMAGE /bin/bash
}
alias dri='docker_interactive_remove'

# Function to launch a docker image in interactive mode
function docker_interactive_remove() {

  local IMAGE=$1
  docker run --rm -it $IMAGE /bin/bash
}
alias dri='docker_interactive_remove'

# Keep docker open so we can attach a shell
function docker_delay() {
  docker run -d $1 /bin/sh -c "while true; do echo Docker; sleep 1; done"
}

##################################################
# Docker Machine
##################################################

# Note! Sometimes you may need to work around a bug in boot2docker by using a different version
# You can do that by adding the --<driver>-boot2docker-url parameter and specify the URL
# to the boot2docker release
# Ex.
#
# docker-machine create default \
#   --driver virtualbox \
#   --virtualbox-memory 4096 \
#   --virtualbox-cpu-count 4 \
#   --virtualbox-ui-type "headless" \
#   --virtualbox-boot2docker-url https://github.com/boot2docker/boot2docker/releases/download/v18.09.1-rc1/boot2docker.iso

# --------------------------------------------------
# Create a docker-machine VM using the xhyve driver
# --------------------------------------------------
function docker_machine_xhyve() {
  docker-machine create default --driver xhyve --xhyve-memory-size 4096 --xhyve-cpu-count 4 --xhyve-experimental-nfs-share=true --engine-storage-driver devicemapper
}

function docker_machine_hyperkit() {
  docker-machine create default --driver hyperkit --hyperkit-memory-size 4096 --hyperkit-cpu-count 4 --hyperkit-experimental-nfs-share=true --engine-storage-driver devicemapper
}

# --------------------------------------------------
# Create a docker-machine VM using the VirtualBox driver
# --------------------------------------------------
function docker_machine_vbox() {
  docker-machine create default --driver virtualbox --virtualbox-memory 4096 --virtualbox-cpu-count 4 --virtualbox-ui-type "headless"
}
