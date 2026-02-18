#!/bin/bash

[[ -z $ENVOY_ID   ]] && ENVOY_ID=""
[[ -z $ENVOY_CONF ]] && ENVOY_CONF=/usr/local/etc/envoy/envoy${ENVOY_ID:+-}${ENVOY_ID}.yml
[[ -z $ENVOY_OPTS ]] && ENVOY_OPTS="--local-address-ip-version v4 -l info"

echo "env config:"
echo "    ENVOY_ID   = $ENVOY_ID"
echo "    ENVOY_CONF = $ENVOY_CONF"
echo "    ENVOY_OPTS = $ENVOY_OPTS"
echo

set -x
exec setpriv --reuid=666 --regid=666 --groups=tty --no-new-privs \
  envoy -c $ENVOY_CONF $ENVOY_OPTS
