#!/bin/bash

[[ -z $PROSODY_ID   ]] && PROSODY_ID=""
[[ -z $PROSODY_CONF ]] && PROSODY_CONF=/usr/local/etc/prosody/prosody${PROSODY_ID:+-}${PROSODY_ID}.cfg.lua

echo "env config:"
echo "    PROSODY_ID   = $PROSODY_ID"
echo "    PROSODY_CONF = $PROSODY_CONF"
echo

if [ ! -f $PROSODY_CONF ]; then
  echo ${0##*/}: error: no config file: $PROSODY_CONF
  exit 1
fi

set -x
exec setpriv --reuid=821 --regid=821 --clear-groups --no-new-privs \
  prosody -F --config=$PROSODY_CONF
