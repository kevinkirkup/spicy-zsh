#!/usr/bin/env zsh

function svn_log_yesterday() {
  `svn log -r {$(date -j -v-1d +%Y-%m-%d)}:$(date +%Y-%m-%d)}`
}
