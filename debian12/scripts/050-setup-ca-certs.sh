#!/bin/bash

set -x

if [ -d /usr/local/etc/pki/ca-certs.d ]; then
  pushd /usr/local/etc/pki/ca-certs.d
  ls *.crt | \
  while read d; do
    ln -snfv /usr/local/etc/pki/ca-certs.d/$d /usr/local/share/ca-certificates
  done
  update-ca-certificates
  popd
fi
