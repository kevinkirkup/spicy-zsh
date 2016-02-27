#!/usr/bin/env zsh

# Docker related alias' and functions

#alias dls='docker ps -a'
#alias dci='docker rmi $(docker images -f dangling=true -q)'
#alias dcc='docker rm $(docker ps -qa)'
#alias din='docker inspect'

# Keep docker open so we can attach a shell
function docker_delay() {
  docker run -d $1 /bin/sh -c "while true; do echo Docker; sleep 1; done"
}
