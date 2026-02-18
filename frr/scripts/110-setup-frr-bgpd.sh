#!/bin/bash

[[ -z $FRR_BGPD ]] && FRR_BGPD=0

echo "env config:"
echo "    FRR_BGPD = $FRR_BGPD"

if [ "$FRR_BGPD" = "yes" -o "$FRR_BGPD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-frr-bgpd.conf.disabled /usr/local/etc/supervisord.d/supervisord-frr-bgpd.conf
  { set +ex; } 2>/dev/null
fi
