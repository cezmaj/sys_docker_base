#!/bin/bash

[[ -z $UNBOUND_ID   ]] && UNBOUND_ID=""
[[ -z $UNBOUND_CONF ]] && UNBOUND_CONF=/usr/local/etc/unbound/unbound${UNBOUND_ID:+-}${UNBOUND_ID}.conf
[[ -z $UNBOUND_MODE ]] && UNBOUND_MODE="active"

echo "env config:"
echo "    UNBOUND_ID   = $UNBOUND_ID"
echo "    UNBOUND_CONF = $UNBOUND_CONF"
echo "    UNBOUND_MODE = $UNBOUND_MODE"
echo

if [ "$UNBOUND_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[unbound-mode-oos]' sleep 666d
fi

if [ ! -f $UNBOUND_CONF ]; then
  echo ${0##*/}: error: no config file: $UNBOUND_CONF
  exit 1
fi

set -x
unbound -V
exec unbound -d -c $UNBOUND_CONF
