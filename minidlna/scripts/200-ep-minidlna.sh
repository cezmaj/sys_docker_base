#!/bin/bash

[[ -z $MINIDLNA_ID   ]] && MINIDLNA_ID=""
[[ -z $MINIDLNA_CONF ]] && MINIDLNA_CONF=/usr/local/etc/minidlna/minidlna${MINIDLNA_ID:+-}${MINIDLNA_ID}.conf

echo "env config:"
echo "    MINIDLNA_ID   = $MINIDLNA_ID"
echo "    MINIDLNA_CONF = $MINIDLNA_CONF"
echo

if [ ! -f $MINIDLNA_CONF ]; then
  echo ${0##*/}: error: no config file: $MINIDLNA_CONF
  exit 1
fi

set -x
exec minidlnad -f $MINIDLNA_CONF -dv
