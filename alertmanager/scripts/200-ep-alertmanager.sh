#!/bin/bash

[[ -z $ALERTMANAGER_ID   ]] && ALERTMANAGER_ID=""
[[ -z $ALERTMANAGER_CONF ]] && ALERTMANAGER_CONF=/usr/local/etc/alertmanager/alertmanager${ALERTMANAGER_ID:+-}${ALERTMANAGER_ID}.yml
[[ -z $ALERTMANAGER_OPTS ]] && ALERTMANAGER_OPTS="--storage.path=/var/opt/alertmanager/data"

echo "env config:"
echo "    ALERTMANAGER_ID   = $ALERTMANAGER_ID"
echo "    ALERTMANAGER_CONF = $ALERTMANAGER_CONF"
echo "    ALERTMANAGER_OPTS = $ALERTMANAGER_OPTS"
echo

if [ ! -f $ALERTMANAGER_CONF ]; then
  echo ${0##*/}: error: no config file: $ALERTMANAGER_CONF
  exit 1
fi

set -x
alertmanager --version
exec setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs \
  alertmanager --config.file=$ALERTMANAGER_CONF $ALERTMANAGER_OPTS
