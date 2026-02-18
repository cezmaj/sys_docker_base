#!/bin/bash

[[ -z $BACULA_DIR ]] && BACULA_DIR=0

echo "env config:"
echo "    BACULA_DIR = $BACULA_DIR"

if [ "$BACULA_DIR" = "yes" -o "$BACULA_DIR" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-bacula-dir.conf.disabled /usr/local/etc/supervisord.d/supervisord-bacula-dir.conf
  { set +ex; } 2>/dev/null
fi
