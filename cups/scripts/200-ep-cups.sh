#!/bin/bash

[[ -z $CUPS_ID   ]] && CUPS_ID=""
[[ -z $CUPS_CONF ]] && CUPS_CONF=/usr/local/etc/cups/cupsd${ID:+-}${ID}.conf
[[ -z $CUPS_FILE ]] && CUPS_FILE=/usr/local/etc/cups/cups-files${ID:+-}${ID}.conf

echo "env config:"
echo "    CUPS_ID   = $CUPS_ID"
echo "    CUPS_CONF = $CUPS_CONF"
echo "    CUPS_FILE = $CUPS_FILE"
echo

if [ ! -f $CUPS_CONF ]; then
  echo ${0##*/}: error: no config file: $CUPS_CONF
  exit 1
fi

if [ ! -f $CUPS_FILE ]; then
  echo ${0##*/}: error: no config file: $CUPS_FILE
  exit 1
fi

set -x
mkdir /run/cups
cups-config --version
cupsd -t -c $CUPS_CONF -s $CUPS_FILE
exec cupsd -f -c $CUPS_CONF -s $CUPS_FILE
