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

# Create a docker-machine VM using the xhyve driver
function docker_machine_xhyve() {
  docker-machine create default --driver xhyve --xhyve-memory-size 4096 --xhyve-cpu-count 4 --xhyve-experimental-nfs-share=true --xhyve-boot2docker-url https://github.com/boot2docker/boot2docker/releases/download/v18.06.1-ce/boot2docker.iso

  #docker-machine create default --driver xhyve --xhyve-memory-size 4096 --xhyve-cpu-count 4 --xhyve-experimental-nfs-share=true --engine-storage-driver devicemapper
}

# Create a docker-machine VM using the VirtualBox driver
function docker_machine_vbox() {
  docker-machine create default --driver virtualbox --virtualbox-memory 4096 --virtualbox-cpu-count 4 --virtualbox-ui-type "headless"
}
