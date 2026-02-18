#!/bin/bash

[[ -z $FREERADIUS_ID   ]] && FREERADIUS_ID=""
[[ -z $FREERADIUS_CONF ]] && FREERADIUS_CONF=/usr/local/etc/raddb${FREERADIUS_ID=:+-}${FREERADIUS_ID=}
[[ -z $FREERADIUS_OPTS ]] && FREERADIUS_OPTS=""

echo "env config:"
echo "    FREERADIUS_ID   = $FREERADIUS_ID"
echo "    FREERADIUS_CONF = $FREERADIUS_CONF"
echo "    FREERADIUS_OPTS = $FREERADIUS_OPTS"
echo

if [ ! -d $FREERADIUS_CONF ]; then
  echo ${0##*/}: error: no config directory: $FREERADIUS_CONF
  exit 1
fi

set -x
exec radiusd -d $FREERADIUS_CONF -f -l stdout $FREERADIUS_OPTS
