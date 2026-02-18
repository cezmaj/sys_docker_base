#!/bin/bash

[[ -z $NTFY_ID   ]] && NTFY_ID=""
[[ -z $NTFY_CONF ]] && NTFY_CONF=/usr/local/etc/ntfy/server${NTFY_ID:+-}${NTFY_ID}.yml

echo "env config:"
echo "    NTFY_ID   = $NTFY_ID"
echo "    NTFY_CONF = $NTFY_CONF"
echo

if [ ! -f $NTFY_CONF ]; then
  echo ${0##*/}: error: no config file: $NTFY_CONF
  exit 1
fi

set -x
ln -snfv $NTFY_CONF /etc/ntfy/
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  ntfy serve -c $NTFY_CONF
