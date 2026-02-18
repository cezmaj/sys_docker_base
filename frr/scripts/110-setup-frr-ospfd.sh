#!/bin/bash

[[ -z $FRR_OSPFD ]] && FRR_OSPFD=0

echo "env config:"
echo "    FRR_OSPFD = $FRR_OSPFD"

if [ "$FRR_OSPFD" = "yes" -o "$FRR_OSPFD" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-frr-ospfd.conf.disabled /usr/local/etc/supervisord.d/supervisord-frr-ospfd.conf
  { set +ex; } 2>/dev/null
fi
