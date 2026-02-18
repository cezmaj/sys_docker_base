#!/bin/bash

[[ -z $SONARQUBE_MODE ]] && SONARQUBE_MODE=active

echo "env config:"
echo "    SONARQUBE_MODE = $SONARQUBE_MODE"
echo

if [ "$SONARQUBE_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[sonarqube-mode-oos]' sleep 666d
fi

if [ ! -d /usr/local/sonarqube/conf ]; then
  echo error: no config directory: /usr/local/sonarqube/conf
  exit 1
fi

set -x
exec setpriv --reuid=435 --regid=0 --groups=435 --no-new-privs \
  sonar.sh console
