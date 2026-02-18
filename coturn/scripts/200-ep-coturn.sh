#!/bin/bash

[[ -z $COTURN_ID   ]] && COTURN_ID=""
[[ -z $COTURN_CONF ]] && COTURN_CONF=/usr/local/etc/coturn/turnserver${COTURN_ID:+-}${COTURN_ID}.conf
[[ -z $COTURN_OPTS ]] && COTURN_OPTS=""

echo "env config:"
echo "    COTURN_ID   = $COTURN_ID"
echo "    COTURN_CONF = $COTURN_CONF"
echo "    COTURN_OPTS = $COTURN_OPTS"
echo

if [ ! -f $COTURN_CONF ]; then
  echo ${0##*/}: error: no config file: $COTURN_CONF
  exit 1
fi

set -x
turnserver --version
exec turnserver -c $COTURN_CONF $COTURN_OPTS
