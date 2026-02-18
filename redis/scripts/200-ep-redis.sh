#!/bin/bash

[[ -z $REDIS_DBCL ]] && REDIS_DBCL=default
[[ -z $REDIS_ID   ]] && REDIS_ID=""
[[ -z $REDIS_CONF ]] && REDIS_CONF=/usr/local/etc/redis/redis${REDIS_ID:+-}${REDIS_ID}.conf
[[ -z $REDIS_DIR  ]] && REDIS_DIR=/var/opt/redis/data/$REDIS_DBCL

echo "env config:"
echo "    REDIS_DBCL = $REDIS_DBCL"
echo "    REDIS_ID   = $REDIS_ID"
echo "    REDIS_CONF = $REDIS_CONF"
echo "    REDIS_DIR  = $REDIS_DIR"
echo

if [ ! -f $REDIS_CONF ]; then
  echo ${0##*/}: error: no config file: $REDIS_CONF
  exit 1
fi

if [ ! -d $REDIS_DIR ]; then
  set -x
  mkdir -pv $REDIS_DIR
  chown none:none $REDIS_DIR
  { set +ex; } 2>/dev/null
fi

set -x
redis-server --version
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  redis-server $REDIS_CONF --dir $REDIS_DIR
