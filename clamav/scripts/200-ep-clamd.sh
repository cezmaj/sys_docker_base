#!/bin/bash

[[ -z $CLAMAV_ID   ]] && CLAMAV_ID=""
[[ -z $CLAMAV_CONF ]] && CLAMAV_CONF=/usr/local/etc/clamav/clamd${CLAMAV_ID:+-}${CLAMAV_ID}.conf

echo "env config:"
echo "    CLAMAV_ID   = $CLAMAV_ID"
echo "    CLAMAV_CONF = $CLAMAV_CONF"
echo

if [ ! -f $CLAMAV_CONF ]; then
  echo ${0##*/}: error: no config file: $CLAMAV_CONF
  exit 1
fi

if [ ! -f /var/opt/clamav/main.cvd ]; then
  set -ex
  freshclam --config-file=/usr/local/etc/clamav/freshclam${CLAMAV_ID:+-}${CLAMAV_ID}.conf
  { set +ex; } 2>/dev/null
fi

set -x
clamconf --non-default 
exec clamd -c $CLAMAV_CONF
