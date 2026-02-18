#!/bin/bash

[[ -z $OPENVPN_ID   ]] && OPENVPN_ID=""
[[ -z $OPENVPN_CONF ]] && OPENVPN_CONF=/usr/local/etc/openvpn/openvpn${OPENVPN_ID:+-}${OPENVPN_ID}.ovpn

echo "env config:"
echo "    OPENVPN_ID   = $OPENVPN_ID"
echo "    OPENVPN_CONF = $OPENVPN_CONF"
echo

if [ ! -f $OPENVPN_CONF ]; then
  echo ${0##*/}: error: no config file: $OPENVPN_CONF
  exit 1
fi

set -x
mkdir -p /dev/net
mknod /dev/net/tun c 10 200
chmod 600 /dev/net/tun
cd $(dirname $OPENVPN_CONF)
openvpn --version
exec openvpn --config $OPENVPN_CONF
