#!/usr/bin/env zsh

##################################################
# Monitor network connections in real time
alias mnetwork='lsof -i'


if [[ $platform == mac ]]; then
  function enable_multicast_route() {
    local interface="en0"
    local address="228.0.0.4"
    print "Added multicast to route table: $interface $address"
    sudo route -nv add -net ${address} -interface ${interface}
  }

  function disable_multicast_route() {
    local address="228.0.0.4"
    print "Removing multicast from route table: $address"
    sudo route -v delete -net ${address}
  }
fi
