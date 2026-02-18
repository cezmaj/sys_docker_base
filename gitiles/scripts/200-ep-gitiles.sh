#!/bin/bash

[[ -z $GITILES_ID   ]] && GITILES_ID=""
[[ -z $GITILES_CONF ]] && GITILES_CONF=/usr/local/etc/gitiles/gitiles${GITILES_ID:+-}${GITILES_ID}.config

echo "env config:"
echo "    GITILES_ID   = $GITILES_ID"
echo "    GITILES_CONF = $GITILES_CONF"
echo

if [ ! -f $GITILES_CONF ]; then
  echo ${0##*/}: error: no config file: $GITILES_CONF
  exit 1
fi

set -x
exec setpriv --reuid=701 --regid=0 --groups=701,321 --no-new-privs \
  /usr/local/gitiles/src/bazel-bin/java/com/google/gitiles/dev/dev \
  --jvm_flag=-Dcom.google.gitiles.sourcePath=/usr/local/gitiles/src \
  --jvm_flag=-Dcom.google.gitiles.configPath=$GITILES_CONF
