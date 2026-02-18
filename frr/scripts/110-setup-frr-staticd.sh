#!/bin/bash

[[ -z $FRR_STATICD ]] && FRR_STATICD=0

echo "env config:"
echo "    FRR_STATICD = $FRR_STATICD"

if [ "$FRR_STATICD" = "yes" -o "$FRR_STATICD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-frr-staticd.conf.disabled /usr/local/etc/supervisord.d/supervisord-frr-staticd.conf
  { set +ex; } 2>/dev/null
fi
