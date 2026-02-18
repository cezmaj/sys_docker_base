#!/bin/bash

[[ -z $NETXMS_ID   ]] && NETXMS_ID=""
[[ -z $NETXMS_CONF ]] && NETXMS_CONF=/usr/local/etc/netxms/netxmsd${NETXMS_ID:+-}${NETXMS_ID}.conf
[[ -z $NETXMS_INIT ]] && NETXMS_INIT=""
[[ -z $NETXMS_MODE ]] && NETXMS_MODE=active

echo "env config:"
echo "    NETXMS_ID   = $NETXMS_ID"
echo "    NETXMS_CONF = $NETXMS_CONF"
echo "    NETXMS_INIT = $NETXMS_INIT"
echo "    NETXMS_MODE = $NETXMS_MODE"
echo

if [ "$NETXMS_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[netxms-server-mode-oos]' sleep 666d
fi

if [ ! -f $NETXMS_CONF ]; then
  echo ${0##*/}: error: no config file: $NETXMS_CONF
  exit 1
fi

if [ "$NETXMS_INIT" = "sqlite" ]; then
  F=$(cat $NETXMS_CONF|grep -i DBName|awk -F= '{print $2}'|xargs)
  D=$(dirname $F)
  echo config: DBName: $F
  if [ ! -d "$D" ]; then
    set -x
    mkdir -v $D
    chown netxms:netxms $D
    { set +ex; } 2>/dev/null
  fi
  if [ ! -f "$F" ]; then
    set -x
    setpriv --reuid=486 --regid=486 --clear-groups nxdbmgr -c $NETXMS_CONF init sqlite
    { set +ex; } 2>/dev/null
  else
    echo warning: sqlite instance already exists
  fi

  D=$(cat $NETXMS_CONF|grep -i DataDirectory|awk -F= '{print $2}'|xargs)
  echo config: DataDirectory: $D
  if [ ! -d "$D" ]; then
    set -x
    mkdir -v $D
    chown netxms:netxms $D
    { set +ex; } 2>/dev/null
  fi
  if [ ! -f "$D/netxms.cmib" ]; then
    ln -sv /usr/local/netxms/var/lib/netxms/netxms.cmib $D
  fi
fi

set -x
netxmsd -v
exec setpriv --reuid=486 --regid=486 --clear-groups --no-new-privs \
  netxmsd -c $NETXMS_CONF -q
