#!/bin/bash

[[ -z $OPENCONNECT_ID    ]] && OPENCONNECT_ID=""
[[ -z $OPENCONNECT_SH    ]] && OPENCONNECT_SH=/usr/local/etc/openconnect/openconnect${OPENCONNECT_ID:+-}${OPENCONNECT_ID}.sh
[[ -z $OPENCONNECT_PROXY ]] && OPENCONNECT_PROXY=""

if [ "$OPENCONNECT_PROXY" != "" ]; then
  export https_proxy=$OPENCONNECT_PROXY
fi

echo "env config:"
echo "    OPENCONNECT_ID    = $OPENCONNECT_ID"
echo "    OPENCONNECT_SH    = $OPENCONNECT_SH"
echo "    OPENCONNECT_PROXY = $OPENCONNECT_PROXY"
echo "    https_proxy       = $https_proxy"
echo

if [ ! -f $OPENCONNECT_SH ]; then
  echo ${0##*/}: error: no sh file: $OPENCONNECT_SH
  exit 1
fi

set -x
openconnect -V
$OPENCONNECT_SH
