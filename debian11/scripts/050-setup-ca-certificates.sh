#!/bin/bash

set -x

if [ -d /usr/local/etc/pki/ca-certificates ]; then
  cd /usr/local/etc/pki/ca-certificates
  ls *.crt | \
  while read d; do
    ln -snfv /usr/local/etc/pki/ca-certificates/$d /usr/local/share/ca-certificates
  done
  update-ca-certificates
fi
