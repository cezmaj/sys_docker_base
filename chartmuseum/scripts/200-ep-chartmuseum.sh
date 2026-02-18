#!/bin/bash

[[ -z $CHARTMUSEUM_ID   ]] && CHARTMUSEUM_ID=""
[[ -z $CHARTMUSEUM_CONF ]] && CHARTMUSEUM_CONF=/usr/local/etc/chartmuseum/chartmuseum${CHARTMUSEUM_ID:+-}${CHARTMUSEUM_ID}.yaml
[[ -z $CHARTMUSEUM_MODE ]] && CHARTMUSEUM_MODE="active"

echo "env config:"
echo "    CHARTMUSEUM_ID   = $CHARTMUSEUM_ID"
echo "    CHARTMUSEUM_CONF = $CHARTMUSEUM_CONF"
echo "    CHARTMUSEUM_MODE = $CHARTMUSEUM_MODE"
echo

if [ "$CHARTMUSEUM_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[chartmuseum-mode-oos]' sleep 666d
fi

if [ ! -f $CHARTMUSEUM_CONF ]; then
  echo ${0##*/}: error: no config file: $CHARTMUSEUM_CONF
  exit 1
fi

set -x
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  chartmuseum --config $CHARTMUSEUM_CONF
