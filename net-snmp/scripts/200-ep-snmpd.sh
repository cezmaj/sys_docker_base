#!/bin/bash

[[ -z $NETSNMPD_ID   ]] && NETSNMPD_ID=""
[[ -z $NETSNMPD_CONF ]] && NETSNMPD_CONF=/usr/local/etc/net-snmp/snmpd${NETSNMPD_ID:+-}${NETSNMPD_ID}.conf
[[ -z $NETSNMPD_OPTS ]] && NETSNMPD_OPTS=""

echo "env config:"
echo "    NETSNMPD_ID   = $NETSNMPD_ID"
echo "    NETSNMPD_CONF = $NETSNMPD_CONF"
echo "    NETSNMPD_OPTS = $NETSNMPD_OPTS"
echo

if [ ! -f $NETSNMPD_CONF ]; then
  echo ${0##*/}: error: no config file: $NETSNMPD_CONF
  exit 1
fi

set -x
snmpd -v
exec snmpd -f -Lo -u none -g none -c $NETSNMPD_CONF $NETSNMPD_OPTS
