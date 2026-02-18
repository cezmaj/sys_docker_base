#!/bin/bash

[[ -z $ACNG_ID   ]] && ACNG_ID=""
[[ -z $ACNG_CONF ]] && ACNG_CONF=/usr/local/etc/acng

echo "env config:"
echo "    ACNG_ID   = $ACNG_ID"
echo "    ACNG_CONF = $ACNG_CONF"
echo

if [ ! -d $ACNG_CONF ]; then
  echo ${0##*/}: error: no config dir: $ACNG_CONF
  exit 1
fi

set -x
mkdir -pv /run/apt-cacher-ng
chown 666:666 /run/apt-cacher-ng
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  apt-cacher-ng foreground=1 -c $ACNG_CONF
