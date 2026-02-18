#!/bin/bash

[[ -z $SAMBA_ID   ]] && SAMBA_ID=""
[[ -z $SAMBA_CONF ]] && SAMBA_CONF=/usr/local/etc/samba/smb${SAMBA_ID:+-}${SAMBA_ID}.conf

echo "env config:"
echo "    SAMBA_ID   = $SAMBA_ID"
echo "    SAMBA_CONF = $SAMBA_CONF"
echo

if [ ! -f $SAMBA_CONF ]; then
  echo ${0##*/}: error: no config file: $SAMBA_CONF
  exit 1
fi

set -x
exec smbd --configfile=$SAMBA_CONF -F --debug-stdout --no-process-group </dev/null
