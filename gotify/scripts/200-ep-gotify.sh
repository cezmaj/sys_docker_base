#!/bin/bash

[[ -z $GOTIFY_DATA ]] && GOTIFY_DATA=/var/opt/gotify

echo "env config:"
echo "    GOTIFY_DATA = $GOTIFY_DATA"
echo

if [ ! -d $GOTIFY_DATA ]; then
  echo ${0##*/}: error: no data directory: $GOTIFY_DATA
  exit 1
fi

set -x
cd $GOTIFY_DATA
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  gotify
