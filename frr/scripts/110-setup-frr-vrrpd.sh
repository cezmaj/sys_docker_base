#!/bin/bash

[[ -z $FRR_VRRPD ]] && FRR_VRRPD=0

echo "env config:"
echo "    FRR_VRRPD = $FRR_VRRPD"

if [ "$FRR_VRRPD" = "yes" -o "$FRR_VRRPD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-frr-vrrpd.conf.disabled /usr/local/etc/supervisord.d/supervisord-frr-vrrpd.conf
  { set +ex; } 2>/dev/null
fi
