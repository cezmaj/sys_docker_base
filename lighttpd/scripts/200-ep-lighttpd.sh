#!/bin/bash

[[ -z $LIGHTTPD_ID   ]] && LIGHTTPD_ID=""
[[ -z $LIGHTTPD_CONF ]] && LIGHTTPD_CONF=/usr/local/etc/lighttpd/lighttpd${LIGHTTPD_ID:+/}${LIGHTTPD_ID}.conf
[[ -z $LIGHTTPD_MODE ]] && LIGHTTPD_MODE=active

echo "env config:"
echo "    LIGHTTPD_ID   = $LIGHTTPD_ID"
echo "    LIGHTTPD_CONF = $LIGHTTPD_CONF"
echo "    LIGHTTPD_MODE = $LIGHTTPD_MODE"
echo

if [ "$LIGHTTPD_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[lighttpd-mode-oos]' sleep 666d
fi

if [ ! -f $LIGHTTPD_CONF ]; then
  echo ${0##*/}: error: no config file: $LIGHTTPD_CONF
  exit 1
fi

set -x
umask 002
chmod a+w /dev/std*
lighttpd -V
lighttpd -f $LIGHTTPD_CONF -tt
lighttpd -f $LIGHTTPD_CONF -p
exec lighttpd -f $LIGHTTPD_CONF -D
