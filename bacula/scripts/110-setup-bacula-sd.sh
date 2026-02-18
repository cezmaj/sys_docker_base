#!/bin/bash

[[ -z $BACULA_SD ]] && BACULA_SD=0

echo "env config:"
echo "    BACULA_SD = $BACULA_SD"

if [ "$BACULA_SD" = "yes" -o "$BACULA_SD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-bacula-sd.conf.disabled /usr/local/etc/supervisord.d/supervisord-bacula-sd.conf
  { set +ex; } 2>/dev/null
fi
