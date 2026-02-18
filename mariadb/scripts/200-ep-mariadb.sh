#!/bin/bash

[[ -z $MARIADB_DBCL ]] && MARIADB_DBCL=default
[[ -z $MARIADB_PORT ]] && MARIADB_PORT=3306
[[ -z $MARIADB_HOST ]] && MARIADB_HOST=0.0.0.0
[[ -z $MARIADB_DATA ]] && MARIADB_DATA=/var/opt/mysql/data/$MARIADB_DBCL
[[ -z $MARIADB_MODE ]] && MARIADB_MODE=active
[[ -z $MARIADB_INIT ]] && MARIADB_INIT=no
[[ -z $MARIADB_DB   ]] && MARIADB_DB=""

echo "env config:"
echo "    MARIADB_DATA = $MARIADB_DATA"
echo "    MARIADB_DBCL = $MARIADB_DBCL"
echo "    MARIADB_PORT = $MARIADB_PORT"
echo "    MARIADB_HOST = $MARIADB_HOST"
echo "    MARIADB_MODE = $MARIADB_MODE"
echo
echo "env config init:"
echo "    MARIADB_INIT = $MARIADB_INIT"
echo "    MARIADB_DB   = $MARIADB_DB"
echo

if [ "$MARIADB_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[mariadb-mode-oos]' sleep 666d
fi

if [ "$MARIADB_INIT" = "yes" -o "$MARIADB_INIT" = "1" ]; then
  if [ ! -d $MARIADB_DATA/mysql ]; then
    set -x
    mkdir -p $MARIADB_DATA
    chown mysql:mysql $MARIADB_DATA
    su mysql -- mydev.sh -c
    { set +ex; } 2>/dev/null
  else
    echo warning: instance already exists
  fi
  echo
fi

if [ ! -d $MARIADB_DATA/mysql ]; then
  echo error: no mydata directory: $MARIADB_DATA
  exit 1
fi

set -x
cd $MARIADB_DATA
exec setpriv --reuid=672 --regid=672 --clear-groups --no-new-privs \
  mariadbd --defaults-file=my-$MARIADB_DBCL.conf --datadir=$MARIADB_DATA
