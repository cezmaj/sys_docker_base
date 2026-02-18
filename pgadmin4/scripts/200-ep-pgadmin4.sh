#!/bin/bash

[[ -z $PGADMIN4_ID   ]] && PGADMIN4_ID=""
[[ -z $PGADMIN4_MODE ]] && PGADMIN4_MODE="active"
[[ -z $GUNICORN_OPTS ]] && GUNICORN_OPTS="-w 1 --threads 10 -b 0.0.0.0:8080 -u none -g none --error-logfile - --access-logfile - --log-level debug --forwarded-allow-ips=*"

echo "env config:"
echo "    PGADMIN4_ID   = $PGADMIN4_ID"
echo "    PGADMIN4_MODE = $PGADMIN4_MODE"
echo "    GUNICORN_OPTS = $GUNICORN_OPTS"
echo

if [ "$PGADMIN4_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[pgadmin4-mode-oos]' sleep 666d
fi

if [ ! -f /var/opt/pgadmin4/pgadmin4.db ]; then
  echo ${0##*/}: error: no database file: /var/opt/pgadmin4/pgadmin4.db
  exit 1
fi

S=$(python3 -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')

set -x
gunicorn --version
cd $S/pgadmin4
exec gunicorn $GUNICORN_OPTS pgAdmin4:app
