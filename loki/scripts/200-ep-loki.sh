#!/bin/bash

[[ -z $LOKI_ID   ]] && LOKI_ID=""
[[ -z $LOKI_CONF ]] && LOKI_CONF=/usr/local/etc/loki/loki${LOKI_ID:+-}${LOKI_ID}.yaml
[[ -z $LOKI_OPTS ]] && LOKI_OPTS=""

echo "env config:"
echo "    LOKI_ID   = $LOKI_ID"
echo "    LOKI_CONF = $LOKI_CONF"
echo "    LOKI_OPTS = $LOKI_OPTS"
echo

if [ ! -f $LOKI_CONF ]; then
  echo ${0##*/}: error: no config file: $LOKI_CONF
  exit 1
fi

set -x
loki --version
exec loki -config.file=$LOKI_CONF $LOKI_OPTS
