#!/bin/bash

set -x
exec setpriv --reuid=480 --regid=0 --groups=480 --no-new-privs \
  /usr/local/nexus/nexus/bin/nexus run
