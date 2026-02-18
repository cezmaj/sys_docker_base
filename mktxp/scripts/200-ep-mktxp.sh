#!/bin/bash

[[ -z $MKTXP_ID   ]] && MKTXP_ID=""
[[ -z $MKTXP_CONF ]] && MKTXP_CONF=/usr/local/etc/mktxp${MKTXP_ID=:+-}${MKTXP_ID}
[[ -z $MKTXP_OPTS ]] && MKTXP_OPTS="export"

echo "env config:"
echo "    MKTXP_ID   = $MKTXP_ID"
echo "    MKTXP_CONF = $MKTXP_CONF"
echo "    MKTXP_OPTS = $MKTXP_OPTS"
echo

if [ ! -d $MKTXP_CONF ]; then
  echo ${0##*/}: error: no config directory: $MKTXP_CONF
  exit 1
fi

set -x
mktxp info
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  mktxp --cfg-dir $MKTXP_CONF $MKTXP_OPTS
