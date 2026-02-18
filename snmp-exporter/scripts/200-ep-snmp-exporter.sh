#!/bin/bash

[[ -z $SNMP_EXPORTER_ID   ]] && SNMP_EXPORTER_ID=""
[[ -z $SNMP_EXPORTER_CONF ]] && SNMP_EXPORTER_CONF=/usr/local/etc/snmp_exporter/snmp${SNMP_EXPORTER_ID:+-}${SNMP_EXPORTER_ID}.yml
[[ -z $SNMP_EXPORTER_OPTS ]] && SNMP_EXPORTER_OPTS="--log.level=debug"

echo "env config:"
echo "    SNMP_EXPORTER_ID   = $SNMP_EXPORTER_ID"
echo "    SNMP_EXPORTER_CONF = $SNMP_EXPORTER_CONF"
echo "    SNMP_EXPORTER_OPTS = $SNMP_EXPORTER_OPTS"
echo

if [ ! -f $SNMP_EXPORTER_CONF ]; then
  echo ${0##*/}: error: no config file: $SNMP_EXPORTER_CONF
  exit 1
fi

set -x
snmp_exporter --version
exec setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs \
  snmp_exporter --config.file=$SNMP_EXPORTER_CONF $SNMP_EXPORTER_OPTS
