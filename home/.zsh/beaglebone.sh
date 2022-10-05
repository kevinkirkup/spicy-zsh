#!/usr/bin/env zsh

BEAGLEBONE_BLACK_SERIAL=/dev/tty.usbserial-A703E9DT

# --------------------------------------------------
# Serial USB Access
# --------------------------------------------------
#alias bbc='screen ${BEAGLEBONE_BLACK_SERIAL} 115200
alias bbc='minicom usb0'

# --------------------------------------------------
# SSH Access
# --------------------------------------------------
#alias bbssh='ssh 192.168.7.2 -l root'

# Debian IOT image
alias bbssh='ssh beaglebone -l debian'

# --------------------------------------------------
# Nerves setup
# --------------------------------------------------
#
# To run Nerves, we have to install the following programs via homebrew.
# https://hexdocs.pm/nerves/installation.html
#
# $ brew update
# $ brew install fwup squashfs coreutils xz pkg-config
