#!/usr/bin/env zsh
##################################################

# Enable the multicast on the routing table
function enable_multicast_route() {

  local interface="en0"
  local address="228.0.0.4"

  print "Added multicast to route table: $interface $addres"
  print ""
  sudo route -nv add -net ${address} -interface ${interface}

  #netstat -nr |grep ${address}
}

# Enable the multicast on the routing table
function disable_multicast_route() {

  local address="228.0.0.4"

  print "Removing multicast from route table: $address"
  print ""
  sudo route -v delete -net ${address}
}
