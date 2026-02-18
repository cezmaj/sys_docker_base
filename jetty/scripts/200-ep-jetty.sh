#!/bin/bash

[[ -z $JETTY_HOME ]] && JETTY_HOME=/usr/local/jetty
[[ -z $JETTY_BASE ]] && JETTY_BASE=/var/opt/jetty/default
[[ -z $JAVA_OPTS  ]] && JAVA_OPTS=

echo "env config:"
echo "    JETTY_HOME = $JETTY_HOME"
echo "    JETTY_BASE = $JETTY_BASE"
echo "    JAVA_OPTS  = $JAVA_OPTS"
echo

export JETTY_HOME JETTY_BASE JAVA_OPTS

set -x
cd $JETTY_BASE
exec setpriv --reuid=461 --regid=0 --groups=461 --no-new-privs \
  $JETTY_HOME/bin/jetty.sh -d supervise
