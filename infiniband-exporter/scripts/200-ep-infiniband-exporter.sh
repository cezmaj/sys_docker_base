#!/bin/bash

if [[ -z $INFINIBAND_EXPORTER_OPTS ]]; then
  INFINIBAND_EXPORTER_OPTS="
  --log.level=info
  "
fi

INFINIBAND_EXPORTER_OPTS=$(echo $INFINIBAND_EXPORTER_OPTS|xargs)

echo "env config:"
echo "    INFINIBAND_EXPORTER_OPTS = $INFINIBAND_EXPORTER_OPTS"
echo

set -x
exec infiniband_exporter $INFINIBAND_EXPORTER_OPTS
