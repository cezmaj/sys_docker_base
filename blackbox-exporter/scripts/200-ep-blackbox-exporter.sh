#!/bin/bash

[[ -z $BLACKBOX_EXPORTER_ID   ]] && BLACKBOX_EXPORTER_ID=""
[[ -z $BLACKBOX_EXPORTER_CONF ]] && BLACKBOX_EXPORTER_CONF=/usr/local/etc/blackbox_exporter/blackbox${BLACKBOX_EXPORTER_ID:+-}${BLACKBOX_EXPORTER_ID}.yml
[[ -z $BLACKBOX_EXPORTER_OPTS ]] && BLACKBOX_EXPORTER_OPTS="--log.level=debug"

echo "env config:"
echo "    BLACKBOX_EXPORTER_ID   = $BLACKBOX_EXPORTER_ID"
echo "    BLACKBOX_EXPORTER_CONF = $BLACKBOX_EXPORTER_CONF"
echo "    BLACKBOX_EXPORTER_OPTS = $BLACKBOX_EXPORTER_OPTS"
echo

if [ ! -f $BLACKBOX_EXPORTER_CONF ]; then
  echo ${0##*/}: error: no config file: $BLACKBOX_EXPORTER_CONF
  exit 1
fi

set -x
blackbox_exporter --version
exec setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs \
  blackbox_exporter --config.file=$BLACKBOX_EXPORTER_CONF $BLACKBOX_EXPORTER_OPTS
