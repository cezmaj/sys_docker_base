#!/bin/bash

[[ -z $SQUID_ID     ]] && SQUID_ID=""
[[ -z $SQUID_CONF   ]] && SQUID_CONF=/usr/local/etc/squid/squid${SQUID_ID:+-}${SQUID_ID}.conf
[[ -z $SQUID_ULIMIT ]] && SQUID_ULIMIT="-n 1024"

echo "env config:"
echo "    SQUID_ID     = $SQUID_ID"
echo "    SQUID_CONF   = $SQUID_CONF"
echo "    SQUID_ULIMIT = $SQUID_ULIMIT"
echo

if [ ! -f $SQUID_CONF ]; then
  echo ${0##*/}: error: no config file: $SQUID_CONF
  exit 1
fi

set -x
ulimit $SQUID_ULIMIT
exec squid -N -f $SQUID_CONF -d1
