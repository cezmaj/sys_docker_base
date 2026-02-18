#!/bin/bash

[[ -z $FRR_MGMTD ]] && FRR_MGMTD=0

echo "env config:"
echo "    FRR_MGMTD = $FRR_MGMTD"

if [ "$FRR_MGMTD" = "yes" -o "$FRR_MGMTD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-frr-mgmtd.conf.disabled /usr/local/etc/supervisord.d/supervisord-frr-mgmtd.conf
  { set +ex; } 2>/dev/null
fi
