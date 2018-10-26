#!/usr/bin/env zsh

# Docker configuration and environment
#eval $(/usr/local/bin/docker-machine env default)

# Update the date/time on the vm
update_docker_time() {
  eval $(docker-machine env default)
  docker run --privileged --rm alpine date -s "$(date -u "+%Y-%m-%d %H:%M:%S")"
}
