#!/bin/bash

[[ -z $ZIPKIN_OPTS ]] && ZIPKIN_OPTS="--logging.level.zipkin2=INFO"

echo "env config:"
echo "    ZIPKIN_OPTS = $ZIPKIN_OPTS"
echo

set -x
exec setpriv --reuid=666 --regid=666 --groups=tty --no-new-privs \
  java -jar /usr/local/zipkin/zipkin-server-exec.jar $ZIPKIN_OPTS
