#!/bin/bash

set -x
export NCSNMPD_USER=ncsnmpd
export NCSNMPD_GROUP=ncsnmpd
export NFAST_HOME=/opt/nfast
exec $NFAST_HOME/sbin/snmpd -f -Lo
