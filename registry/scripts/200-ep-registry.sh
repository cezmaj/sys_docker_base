#!/bin/bash

[[ -z $REGISTRY_ID   ]] && REGISTRY_ID=""
[[ -z $REGISTRY_CONF ]] && REGISTRY_CONF=/usr/local/etc/registry/config${REGISTRY_ID:+-}${REGISTRY_ID}.yml
[[ -z $REGISTRY_MODE ]] && REGISTRY_MODE="active"
[[ -z $OTEL_TRACES_EXPORTER ]] && export OTEL_TRACES_EXPORTER="none"

echo "env config:"
echo "    REGISTRY_ID   = $REGISTRY_ID"
echo "    REGISTRY_CONF = $REGISTRY_CONF"
echo "    REGISTRY_MODE = $REGISTRY_MODE"
echo
echo "env config otel:"
echo "    OTEL_TRACES_EXPORTER = $OTEL_TRACES_EXPORTER"
echo

if [ "$REGISTRY_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[registry-mode-oos]' sleep 666d
fi

if [ ! -f $REGISTRY_CONF ]; then
  echo ${0##*/}: error: no config file: $REGISTRY_CONF
  exit 1
fi

set -x
registry --version
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  registry serve $REGISTRY_CONF
