#!/bin/bash

D=/usr/local/etc/pki/ca-certs.d

set -x

if [ -d $D ]; then
  pushd $D
  ls *.crt | \
  while read f; do
    ln -snfv $D/$f /usr/local/share/ca-certificates
  done
  update-ca-certificates
  popd
fi
