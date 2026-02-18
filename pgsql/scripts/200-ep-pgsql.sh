#!/bin/bash

[[ -z $PGSQL_DBCL ]] && export PGSQL_DBCL=main
[[ -z $PGSQL_PORT ]] && export PGSQL_PORT=5432
[[ -z $PGSQL_HOST ]] && export PGSQL_HOST=0.0.0.0
[[ -z $PGSQL_DATA ]] && export PGSQL_DATA=/var/opt/pgsql/data/${PGSQL_DBCL}/${INFO_VER%.*}
[[ -z $PGSQL_MODE ]] && export PGSQL_MODE=active
[[ -z $PGSQL_INIT ]] && export PGSQL_INIT=no
[[ -z $PGSQL_DB   ]] && export PGSQL_DB=""

echo "env config:"
echo "    PGSQL_DATA = $PGSQL_DATA"
echo "    PGSQL_DBCL = $PGSQL_DBCL"
echo "    PGSQL_PORT = $PGSQL_PORT"
echo "    PGSQL_HOST = $PGSQL_HOST"
echo "    PGSQL_MODE = $PGSQL_MODE"
echo
echo "env config init:"
echo "    PGSQL_INIT = $PGSQL_INIT"
echo "    PGSQL_DB   = $PGSQL_DB"
echo

if [ "$PGSQL_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[pgsql-mode-oos]' sleep 666d
fi

if [ "$PGSQL_INIT" = "yes" -o "$PGSQL_INIT" = "1" ]; then
  if [ ! -f $PGSQL_DATA/PG_VERSION ]; then
    set -x
    su postgres -- pgdev.sh -c
    { set +ex; } 2>/dev/null
  else
    echo warning: instance already exists
  fi
  echo
fi

if [ ! -d $PGSQL_DATA ]; then
  echo error: no pgdata directory: $PGSQL_DATA
  exit 1
fi

set -x
postgres --version
exec setpriv --reuid=26 --regid=26 --clear-groups --no-new-privs \
  postgres -D $PGSQL_DATA -h $PGSQL_HOST -p $PGSQL_PORT
