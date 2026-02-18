#!/bin/bash

[[ -z $SYDENT_CONF     ]] && SYDENT_CONF=/var/opt/sydent/sydent.conf
[[ -z $SYDENT_DB_PATH  ]] && SYDENT_DB_PATH=/var/opt/sydent/sydent.db
[[ -z $SYDENT_PID_FILE ]] && SYDENT_PID_FILE=/var/opt/sydent/sydent.pid

export SYDENT_CONF
export SYDENT_DB_PATH
export SYDENT_PID_FILE

echo "env config:"
echo "    SYDENT_CONF     = $SYDENT_CONF"
echo "    SYDENT_DB_PATH  = $SYDENT_DB_PATH"
echo "    SYDENT_PID_FILE = $SYDENT_PID_FILE"
echo

set -x
cd /var/opt/sydent
exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
  sydent
