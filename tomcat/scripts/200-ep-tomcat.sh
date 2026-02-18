#!/bin/bash

[[ -z $CATALINA_BASE ]] && CATALINA_BASE=/var/opt/tomcat
[[ -z $CATALINA_OPTS ]] && CATALINA_OPTS=
[[ -n $JAVA_OPTS     ]] && CATALINA_OPTS="$CATALINA_OPTS $JAVA_OPTS"

echo "env config:"
echo "    CATALINA_BASE = $CATALINA_BASE"
echo "    CATALINA_OPTS = $CATALINA_OPTS"
echo "    JAVA_OPTS     = $JAVA_OPTS"
echo

export CATALINA_BASE CATALINA_OPTS

set -x
exec setpriv --reuid=91 --regid=0 --groups=91 --no-new-privs \
  catalina.sh run
