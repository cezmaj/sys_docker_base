#!/bin/bash

if [ -d /var/opt/mediawiki/extensions ]; then
  pushd /var/opt/mediawiki/extensions
  ls | \
  while read d; do
    set -x
      ln -snfv /var/opt/mediawiki/extensions/$d /usr/local/mediawiki/extensions
    { set +ex; } 2>/dev/null
  done
  popd
fi
