#!/usr/bin/env zsh

BEAGLEBONE_BLACK_SERIAL=/dev/tty.usbserial-A703E9DT

#alias bbc='screen ${BEAGLEBONE_BLACK_SERIAL} 115200
alias bbc='minicom usb0'
alias bbssh='ssh 192.168.7.2 -l root'
