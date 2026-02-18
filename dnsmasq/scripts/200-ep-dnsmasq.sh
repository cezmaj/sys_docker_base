#!/bin/bash

[[ -z $DNSMASQ_ID   ]] && DNSMASQ_ID=""
[[ -z $DNSMASQ_CONF ]] && DNSMASQ_CONF=/usr/local/etc/dnsmasq${DNSMASQ_ID:+-}${DNSMASQ_ID}.d

echo "env config:"
echo "    DNSMASQ_ID    = $DNSMASQ_ID"
echo "    DNSMASQ_CONF  = $DNSMASQ_CONF"
echo

if [ -f $DNSMASQ_CONF ]; then
  DNSMASQ_CONFIG=--conf-file=$DNSMASQ_CONF
elif [ -d $DNSMASQ_CONF ]; then
  DNSMASQ_CONFIG=--conf-dir=$DNSMASQ_CONF
else
  echo ${0##*/}: error: no config file/directory: $DNSMASQ_CONF
  exit 1
fi

set -x
exec dnsmasq $DNSMASQ_CONFIG --keep-in-foreground --log-facility=-
