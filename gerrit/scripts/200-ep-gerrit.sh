#!/bin/bash

[[ -z $GERRIT_DATA ]] && GERRIT_DATA=/var/opt/gerrit
[[ -z $GERRIT_MODE ]] && GERRIT_MODE=active
[[ -z $GERRIT_INIT ]] && GERRIT_INIT=no

echo "env config:"
echo "    GERRIT_DATA = $GERRIT_DATA"
echo "    GERRIT_MODE = $GERRIT_MODE"
echo
echo "env config init:"
echo "    GERRIT_INIT = $GERRIT_INIT"
echo

if [ "$GERRIT_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[gerrit-mode-oos]' sleep 666d
fi

if [ "$GERRIT_INIT" = "yes" -o "$GERRIT_INIT" = "1" ]; then
  if [ ! -d $GERRIT_DATA/etc ]; then
    set -x
    mkdir -pv $GERRIT_DATA
    chown -v gerrit:gerrit $GERRIT_DATA
    setpriv --reuid=701 --regid=0 --groups=701 --no-new-privs \
      java -jar /usr/local/gerrit/gerrit.war init -d $GERRIT_DATA --batch --no-auto-start --skip-all-downloads --skip-plugins
    { set +ex; } 2>/dev/null
  else
    echo ${0##*/}: info: instance already exists
  fi
  echo
fi

if [ ! -d $GERRIT_DATA ]; then
  echo ${0##*/}: error: no data directory: $GERRIT_DATA
  exit 1
fi

set -x
java -jar /usr/local/gerrit/gerrit.war version
exec setpriv --reuid=701 --regid=0 --groups=701 --no-new-privs \
  java -jar /usr/local/gerrit/gerrit.war daemon -d $GERRIT_DATA --console-log
