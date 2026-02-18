#!/bin/bash

[[ -z $DOVECOT_ID   ]] && DOVECOT_ID=""
[[ -z $DOVECOT_CONF ]] && DOVECOT_CONF=/usr/local/etc/dovecot/dovecot${DOVECOT_ID:+-}${DOVECOT_ID}.conf
[[ -z $DOVECOT_OPTS ]] && DOVECOT_OPTS=""
[[ -z $DOVECOT_MODE ]] && DOVECOT_MODE=active

echo "env config:"
echo "    DOVECOT_ID   = $DOVECOT_ID"
echo "    DOVECOT_CONF = $DOVECOT_CONF"
echo "    DOVECOT_OPTS = $DOVECOT_OPTS"
echo "    DOVECOT_MODE = $DOVECOT_MODE"
echo

if [ "$DOVECOT_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[dovecot-mode-oos]' sleep 666d
fi

if [ ! -f $DOVECOT_CONF ]; then
  echo ${0##*/}: error: no config file: $DOVECOT_CONF
  exit 1
fi

set -x
dovecot --version
exec dovecot -F -c $DOVECOT_CONF $DOVECOT_OPTS
