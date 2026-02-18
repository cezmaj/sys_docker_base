#!/bin/bash

set -x
export NFAST_USER=nfast
export NFAST_GROUP=nfast
export NFAST_HOME=/opt/nfast
exec $NFAST_HOME/sbin/hardserver
