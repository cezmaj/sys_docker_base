#!/bin/bash

[[ -z $PROMTAIL_ID   ]] && PROMTAIL_ID=""
[[ -z $PROMTAIL_CONF ]] && PROMTAIL_CONF=/usr/local/etc/promtail/promtail${PROMTAIL_ID:+-}${PROMTAIL_ID}.yaml
[[ -z $PROMTAIL_OPTS ]] && PROMTAIL_OPTS=""

echo "env config:"
echo "    PROMTAIL_ID   = $PROMTAIL_ID"
echo "    PROMTAIL_CONF = $PROMTAIL_CONF"
echo "    PROMTAIL_OPTS = $PROMTAIL_OPTS"
echo

if [ ! -f $PROMTAIL_CONF ]; then
  echo ${0##*/}: error: no config file: $PROMTAIL_CONF
  exit 1
fi

set -x
promtail --version
exec promtail -config.file=$PROMTAIL_CONF $PROMTAIL_OPTS
