#!/bin/bash

if [[ -z $NODE_EXPORTER_OPTS ]]; then
  NODE_EXPORTER_OPTS="
  --path.rootfs=/host
  --log.level=info
  "
elif [[ $NODE_EXPORTER_OPTS == "--opts.k8s" ]]; then
  NODE_EXPORTER_OPTS="
  --path.rootfs=/host
  --log.level=info
  --collector.cpu.info
  --collector.processes
  --collector.netdev.device-exclude=^(veth.*|[a-f0-9]{15}|cali.*|vnet.*)$
  --collector.netclass.ignored-devices=^(veth.*|[a-f0-9]{15}|cali.*|vnet.*)$
  --collector.filesystem.mount-points-exclude=^/(dev|proc|run/credentials/.+|sys|var/lib/docker/.+|var/lib/containers/storage/.+|run|var/lib/kubelet/.+)($|/)
  "
fi

NODE_EXPORTER_OPTS=$(echo $NODE_EXPORTER_OPTS|xargs)

echo "env config:"
echo "    NODE_EXPORTER_OPTS = $NODE_EXPORTER_OPTS"
echo

set -x
node_exporter --version
exec node_exporter $NODE_EXPORTER_OPTS
