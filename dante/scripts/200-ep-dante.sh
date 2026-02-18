#!/bin/bash

[[ -z $DANTE_ID    ]] && DANTE_ID=""
[[ -z $DANTE_CONF  ]] && DANTE_CONF=/usr/local/etc/dante/sockd${DANTE_ID:+-}${DANTE_ID}.conf
[[ -z $DANTE_DEBUG ]] && DANTE_DEBUG=0
[[ -z $DANTE_MODE  ]] && DANTE_MODE=active

echo "env config:"
echo "    DANTE_ID    = $DANTE_ID"
echo "    DANTE_CONF  = $DANTE_CONF"
echo "    DANTE_DEBUG = $DANTE_DEBUG"
echo "    DANTE_MODE  = $DANTE_MODE"
echo

if [ "$DANTE_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[dante-mode-oos]' sleep 666d
fi

if [ ! -f $DANTE_CONF ]; then
  echo ${0##*/}: error: no config file: $DANTE_CONF
  exit 1
fi

set -x
sockd -v
exec sockd -f $DANTE_CONF -d $DANTE_DEBUG
