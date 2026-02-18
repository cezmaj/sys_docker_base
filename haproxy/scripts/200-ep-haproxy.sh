#!/bin/bash

[[ -z $HAPROXY_ID   ]] && HAPROXY_ID=""
[[ -z $HAPROXY_CONF ]] && HAPROXY_CONF=/usr/local/etc/haproxy/haproxy${HAPROXY_ID:+-}${HAPROXY_ID}.cfg
[[ -z $HAPROXY_MODE ]] && HAPROXY_MODE=active

echo "env config:"
echo "    HAPROXY_ID   = $HAPROXY_ID"
echo "    HAPROXY_CONF = $HAPROXY_CONF"
echo "    HAPROXY_MODE = $HAPROXY_MODE"
echo

if [ "$HAPROXY_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[haproxy-mode-oos]' sleep 666d
fi

if [ ! -f $HAPROXY_CONF ]; then
  echo ${0##*/}: error: no config file: $HAPROXY_CONF
  exit 1
fi

set -x
haproxy -v
exec haproxy -f $HAPROXY_CONF
