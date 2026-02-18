#!/bin/bash

[[ -z $SOCAT_ID    ]] && SOCAT_ID=""
[[ -z $SOCAT_OPTS  ]] && SOCAT_OPTS=""
[[ -z $SOCAT_ADDR1 ]] && SOCAT_ADDR1=""
[[ -z $SOCAT_ADDR2 ]] && SOCAT_ADDR2=""

SOCAT_OPTS=$(echo $SOCAT_OPTS|sed 's/,/ /g')

echo "env config:"
echo "    SOCAT_ID    = $SOCAT_ID"
echo "    SOCAT_OPTS  = $SOCAT_OPTS"
echo "    SOCAT_ADDR1 = $SOCAT_ADDR1"
echo "    SOCAT_ADDR2 = $SOCAT_ADDR2"
echo

set -x
socat -V
exec socat $SOCAT_OPTS $SOCAT_ADDR1 $SOCAT_ADDR2
