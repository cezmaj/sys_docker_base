#!/bin/bash

[[ -z $JAVA_OPTS     ]] && JAVA_OPTS=
[[ -n $CATALINA_OPTS ]] && JAVA_OPTS="$JAVA_OPTS $CATALINA_OPTS"

echo "env config:"
echo "    JAVA_OPTS     = $JAVA_OPTS"
echo "    CATALINA_OPTS = $CATALINA_OPTS"
echo

export JAVA_OPTS
export WILDFLY_HOME=/usr/local/wildfly
export LAUNCH_JBOSS_IN_BACKGROUND=1

set -x
exec setpriv --reuid=460 --regid=0 --groups=460 --no-new-privs \
  $WILDFLY_HOME/bin/standalone.sh -c standalone.xml -b 0.0.0.0
