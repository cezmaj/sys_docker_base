#!/bin/bash

[[ -z $JAEGER_OPTS ]] && JAEGER_OPTS="--collector.zipkin.host-port=:9411 --log-level=info"

echo "env config:"
echo "    JAEGER_OPTS = $JAEGER_OPTS"
echo

set -x
export JAEGER_DISABLED=true
exec setpriv --reuid=666 --regid=666 --groups=tty --no-new-privs \
  jaeger-all-in-one $JAEGER_OPTS
