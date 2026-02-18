#!/bin/bash

[[ -z $HOSTAPD_ID   ]] && HOSTAPD_ID=""
[[ -z $HOSTAPD_CONF ]] && HOSTAPD_CONF=/usr/local/etc/hostapd/hostapd${HOSTAPD_ID:+-}${HOSTAPD_ID}.conf
[[ -z $HOSTAPD_OPTS ]] && HOSTAPD_OPTS=""

echo "env config:"
echo "    HOSTAPD_ID   = $HOSTAPD_ID"
echo "    HOSTAPD_CONF = $HOSTAPD_CONF"
echo "    HOSTAPD_OPTS = $HOSTAPD_OPTS"
echo

if [ ! -f $HOSTAPD_CONF ]; then
  echo ${0##*/}: error: no config file: $HOSTAPD_CONF
  exit 1
fi

set -x
hostapd -v
exec hostapd $HOSTAPD_CONF $HOSTAPD_OPTS
