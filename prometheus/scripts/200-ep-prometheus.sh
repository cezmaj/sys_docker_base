#!/bin/bash

[[ -z $PROMETHEUS_ID   ]] && PROMETHEUS_ID=""
[[ -z $PROMETHEUS_CONF ]] && PROMETHEUS_CONF=/usr/local/etc/prometheus/prometheus${PROMETHEUS_ID:+-}${PROMETHEUS_ID}.yml
[[ -z $PROMETHEUS_OPTS ]] && PROMETHEUS_OPTS="--storage.tsdb.path=/var/opt/prometheus/data"

echo "env config:"
echo "    PROMETHEUS_ID   = $PROMETHEUS_ID"
echo "    PROMETHEUS_CONF = $PROMETHEUS_CONF"
echo "    PROMETHEUS_OPTS = $PROMETHEUS_OPTS"
echo

if [ ! -f $PROMETHEUS_CONF ]; then
  echo ${0##*/}: error: no config file: $PROMETHEUS_CONF
  exit 1
fi

set -x
prometheus --version
exec prometheus --config.file=$PROMETHEUS_CONF $PROMETHEUS_OPTS
