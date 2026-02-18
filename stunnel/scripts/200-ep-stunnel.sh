#!/bin/bash

[[ -z $STUNNEL_ID   ]] && STUNNEL_ID=""
[[ -z $STUNNEL_CONF ]] && STUNNEL_CONF=/usr/local/etc/stunnel/stunnel${STUNNEL_ID:+-}${STUNNEL_ID}.conf
[[ -z $STUNNEL_MODE ]] && STUNNEL_MODE=active

echo "env config:"
echo "    STUNNEL_ID   = $STUNNEL_ID"
echo "    STUNNEL_CONF = $STUNNEL_CONF"
echo "    STUNNEL_MODE = $STUNNEL_MODE"
echo

if [ "$STUNNEL_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[stunnel-mode-oos]' sleep 666d
fi

if [ ! -f $STUNNEL_CONF ]; then
  echo ${0##*/}: error: no config file: $STUNNEL_CONF
  exit 1
fi

set -x
stunnel -version
exec stunnel $STUNNEL_CONF
