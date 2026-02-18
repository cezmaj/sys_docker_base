#!/bin/bash

[[ -z $COREDNS_ID   ]] && COREDNS_ID=""
[[ -z $COREDNS_CONF ]] && COREDNS_CONF=/usr/local/etc/coredns/Corefile${COREDNS_ID:+-}${COREDNS_ID}
[[ -z $COREDNS_MODE ]] && COREDNS_MODE=active

echo "env config:"
echo "    COREDNS_ID   = $COREDNS_ID"
echo "    COREDNS_CONF = $COREDNS_CONF"
echo "    COREDNS_MODE = $COREDNS_MODE"
echo

if [ "$COREDNS_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[coredns-mode-oos]' sleep 666d
fi

if [ ! -f $COREDNS_CONF ]; then
  echo error: no config file: $COREDNS_CONF
  exit 1
fi

set -x
coredns --version
exec setpriv --reuid=666 --regid=0 --groups=666 --no-new-privs \
  coredns -conf=$COREDNS_CONF
