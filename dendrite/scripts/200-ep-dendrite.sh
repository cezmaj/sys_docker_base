#!/bin/bash

[[ -z $DENDRITE_ID   ]] && DENDRITE_ID=""
[[ -z $DENDRITE_CONF ]] && DENDRITE_CONF=/usr/local/etc/dendrite/dendrite${DENDRITE_ID:+-}${DENDRITE_ID}.yaml
[[ -z $DENDRITE_OPTS ]] && DENDRITE_OPTS=""

echo "env config:"
echo "    DENDRITE_ID   = $DENDRITE_ID"
echo "    DENDRITE_CONF = $DENDRITE_CONF"
echo "    DENDRITE_OPTS = $DENDRITE_OPTS"
echo

if [ ! -f $DENDRITE_CONF ]; then
  echo ${0##*/}: error: no config file: $DENDRITE_CONF
  exit 1
fi

set -x
exec setpriv --reuid=831 --regid=831 --clear-groups --no-new-privs \
  dendrite-monolith-server -config $DENDRITE_CONF $DENDRITE_OPTS
