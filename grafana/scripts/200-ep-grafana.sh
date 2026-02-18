#!/bin/bash

[[ -z $GRAFANA_ID   ]] && GRAFANA_ID=""
[[ -z $GRAFANA_CONF ]] && GRAFANA_CONF=/usr/local/etc/grafana/grafana${GRAFANA_ID:+-}${GRAFANA_ID}.ini

echo "env config:"
echo "    GRAFANA_ID   = $GRAFANA_ID"
echo "    GRAFANA_CONF = $GRAFANA_CONF"
echo

if [ ! -f $GRAFANA_CONF ]; then
  echo ${0##*/}: error: no config file: $GRAFANA_CONF
  exit 1
fi

set -x
exec setpriv --reuid=472 --regid=0 --groups=472 --no-new-privs \
  grafana server --homepath /usr/local/grafana --config=$GRAFANA_CONF
