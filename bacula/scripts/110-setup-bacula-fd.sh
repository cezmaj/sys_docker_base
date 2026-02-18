#!/bin/bash

[[ -z $BACULA_FD ]] && BACULA_FD=0

echo "env config:"
echo "    BACULA_FD = $BACULA_FD"

if [ "$BACULA_FD" = "yes" -o "$BACULA_FD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-bacula-fd.conf.disabled /usr/local/etc/supervisord.d/supervisord-bacula-fd.conf
  { set +ex; } 2>/dev/null
fi
