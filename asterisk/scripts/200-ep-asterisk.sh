#!/bin/bash

[[ -z $ASTERISK_ID   ]] && ASTERISK_ID=""
[[ -z $ASTERISK_CONF ]] && ASTERISK_CONF=/usr/local/etc/asterisk/asterisk${ASTERISK_ID:+-}${ASTERISK_ID}.conf
[[ -z $ASTERISK_DATA ]] && ASTERISK_DATA=/var/opt/asterisk
[[ -z $ASTERISK_INIT ]] && ASTERISK_INIT=no


echo "env config:"
echo "    ASTERISK_ID   = $ASTERISK_ID"
echo "    ASTERISK_CONF = $ASTERISK_CONF"
echo "    ASTERISK_DATA = $ASTERISK_DATA"
echo
echo "env config init:"
echo "    ASTERISK_INIT = $ASTERISK_INIT"
echo

if [ ! -f $ASTERISK_CONF ]; then
  echo ${0##*/}: error: no config file: $ASTERISK_CONF
  exit 1
fi

if [ "$ASTERISK_INIT" = "yes" -o "$ASTERISK_INIT" = "1" ]; then
  if [ ! -d $ASTERISK_DATA/spool ]; then
    set -x
    mkdir -p $ASTERISK_DATA
    cd /usr/local/asterisk
    tar cf - var | (cd $ASTERISK_DATA; tar xf - --strip-components=1)
    chown -R asterisk:asterisk $ASTERISK_DATA
    { set +ex; } 2>/dev/null
  else
    echo warning: data already exists
  fi
  echo
fi

if [ ! -d $ASTERISK_DATA/spool ]; then
  echo error: no data directory: $ASTERISK_DATA
  exit 1
fi

set -x
exec asterisk -f -C $ASTERISK_CONF
