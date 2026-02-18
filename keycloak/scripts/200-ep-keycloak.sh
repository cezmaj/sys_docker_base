#!/bin/bash

[[ -z $KEYCLOAK_ID   ]] && KEYCLOAK_ID=""
[[ -z $KEYCLOAK_CONF ]] && KEYCLOAK_CONF=/usr/local/etc/keycloak/keycloak${KEYCLOAK_ID:+-}${KEYCLOAK_ID}.conf
[[ -z $KEYCLOAK_ENV  ]] && KEYCLOAK_ENV=/usr/local/etc/keycloak/keycloak${KEYCLOAK_ID:+-}${KEYCLOAK_ID}.env
[[ -z $KEYCLOAK_MODE ]] && KEYCLOAK_MODE=active

echo "env config:"
echo "    KEYCLOAK_ID   = $KEYCLOAK_ID"
echo "    KEYCLOAK_CONF = $KEYCLOAK_CONF"
echo "    KEYCLOAK_ENV  = $KEYCLOAK_ENV"
echo "    KEYCLOAK_MODE = $KEYCLOAK_MODE"
echo

if [ "$KEYCLOAK_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[keycloak-mode-oos]' sleep 666d
fi

if [ -f $KEYCLOAK_ENV ]; then
  source $KEYCLOAK_ENV
fi
echo "env config KC:"
env | grep ^KC_ | sort | sed 's/^/    /'
echo

set -x
setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs kc.sh -cf $KEYCLOAK_CONF --version
setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs kc.sh -cf $KEYCLOAK_CONF build
exec setpriv --reuid=666 --regid=666 --groups=666 --no-new-privs \
  kc.sh -cf $KEYCLOAK_CONF start --optimized
