#!/bin/bash

[[ -z $MONGO_ID   ]] && MONGO_ID=""
[[ -z $MONGO_CONF ]] && MONGO_CONF=/usr/local/etc/mongo/mongod${MONGO_ID:+-}${MONGO_ID}.conf
[[ -z $MONGO_OPTS ]] && MONGO_OPTS=""

echo "env config:"
echo "    MONGO_ID   = $MONGO_ID"
echo "    MONGO_CONF = $MONGO_CONF"
echo "    MONGO_OPTS = $MONGO_OPTS"
echo

if [ ! -f $MONGO_CONF ]; then
  echo ${0##*/}: error: no config file: $MONGO_CONF
  exit 1
fi

set -x
exec setpriv --reuid=980 --regid=980 --clear-groups --no-new-privs \
  mongod -f $MONGO_CONF $MONGO_OPTS
