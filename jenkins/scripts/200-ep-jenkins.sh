#!/bin/bash

[[ -z $JENKINS_HOME ]] && JENKINS_HOME=/var/opt/jenkins
[[ -z $JENKINS_URLS ]] && JENKINS_URLS=/jenkins
[[ -z $JENKINS_MODE ]] && JENKINS_MODE=active

echo "env config:"
echo "    JENKINS_HOME = $JENKINS_HOME"
echo "    JENKINS_URLS = $JENKINS_URLS"
echo "    JENKINS_MODE = $JENKINS_MODE"
echo

export JENKINS_HOME

if [ "$JENKINS_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[jenkins-mode-oos]' sleep 666d
fi

set -x
java -jar /usr/local/jenkins/jenkins.war --version
exec setpriv --reuid=666 --regid=666 --groups=tty --no-new-privs \
  java -jar /usr/local/jenkins/jenkins.war \
  --webroot=/tmp/webroot \
  --prefix=$JENKINS_URLS \
  --accessLoggerClassName=winstone.accesslog.SimpleAccessLogger \
  --simpleAccessLogger.format=combined \
  --simpleAccessLogger.file=/dev/stdout
