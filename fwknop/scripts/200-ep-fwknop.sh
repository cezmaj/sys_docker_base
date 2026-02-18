#!/bin/bash

[[ -z $FWKNOP_ID   ]] && FWKNOP_ID=""
[[ -z $FWKNOP_CONF ]] && FWKNOP_CONF=/usr/local/etc/fwknop/fwknopd${FWKNOP_ID:+-}${FWKNOP_ID}.conf

echo "env config:"
echo "    FWKNOP_ID   = $FWKNOP_ID"
echo "    FWKNOP_CONF = $FWKNOP_CONF"
echo

if [ ! -f $FWKNOP_CONF ]; then
  echo ${0##*/}: error: no config file: $FWKNOP_CONF
  exit 1
fi

set -x
exec fwknopd -c $FWKNOP_CONF -f
