#!/bin/sh

# Postgresql
alias pg_start='pg_ctl -D /usr/local/var/postgres start'

# Function to build the pgrouting library for the native Postgres App
function build_libpgrouting() {
  TAG=$1

  git clone git@github.com:pgRouting/pgrouting.git
  cd pgrouting
  git checkout $TAG
  mkdir build && cd build
  PATH="/Applications/Postgres.app/Contents/Versions/13/bin:${PATH}" cmake ..
  make && make install
  cd ../..
  rm -rf pgrouting
}
