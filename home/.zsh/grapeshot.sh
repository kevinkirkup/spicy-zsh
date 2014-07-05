#!/usr/local/env zsh

############################################################
# Function to capture the multicast traffic for the specified
# address and port
############################################################
function dumpStreams {
############################################################

    local filename=$1
    local address=$2
    local fromPort=$3
    local toPort=$4

    local command="tcpdump -w ${filename}.pcap net ${address}"

    # Check the input parameter
    if [ ! -n "${filename}" ] || [ ! -n "${address}" ]; then

        # Print some help text
        echo "dumpStreams <filename> <address> [<fromPort>,<toPort>]"
        return -1
    fi

    # Use a port range
    if [ -n "${fromPort}" ] && [ -n "${toPort}" ]; then
        command+=" portrange ${fromPort}-${toPort}"

    # Use a single port
    elif [ -n "${fromPort}" ]; then
        command+=" udp port ${fromPort}"
    fi

    echo ${command}
    `${command}`

    return 0
}

############################################################
# Function to dump the UDP Headers for the packets
# Would also like to dump the PMT/PAT PES Headers too
############################################################
function dumpHeaders {
############################################################
    return 0
}

