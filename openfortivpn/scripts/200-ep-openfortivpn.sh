#!/bin/bash

[[ -z $OPENFORTIVPN_ID    ]] && OPENFORTIVPN_ID="default"
[[ -z $OPENFORTIVPN_CONF  ]] && OPENFORTIVPN_CONF=/usr/local/etc/openfortivpn/config${OPENFORTIVPN_ID:+-}${OPENFORTIVPN_ID}
[[ -z $OPENFORTIVPN_PROXY ]] && OPENFORTIVPN_PROXY=""

if [ "$OPENFORTIVPN_PROXY" != "" ]; then
  export https_proxy=$OPENFORTIVPN_PROXY
fi

echo "env config:"
echo "    OPENFORTIVPN_ID    = $OPENFORTIVPN_ID"
echo "    OPENFORTIVPN_CONF  = $OPENFORTIVPN_CONF"
echo "    OPENFORTIVPN_PROXY = $OPENFORTIVPN_PROXY"
echo "    https_proxy        = $https_proxy"
echo

if [ ! -f $OPENFORTIVPN_CONF ]; then
  echo ${0##*/}: error: no config file: $OPENFORTIVPN_CONF
  exit 1
fi

set -x
openfortivpn --version
exec openfortivpn -c $OPENFORTIVPN_CONF
