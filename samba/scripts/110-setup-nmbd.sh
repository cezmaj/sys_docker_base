#!/bin/bash

[[ -z $SAMBA_NMBD ]] && SAMBA_NMBD=0

echo "env config:"
echo "    SAMBA_NMBD = $SAMBA_NMBD"

if [ "$SAMBA_NMBD" = "yes" -o "$SAMBA_NMBD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-nmbd.conf.disabled /usr/local/etc/supervisord.d/supervisord-nmbd.conf
  { set +ex; } 2>/dev/null
fi
