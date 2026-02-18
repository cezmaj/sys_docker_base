#!/bin/bash

echo "env config:"
echo "    PODMAN_EXPORTER_OPTS = $PODMAN_EXPORTER_OPTS"
echo "    CONTAINER_HOST       = $CONTAINER_HOST"
echo

set -x
podman-exporter --version
exec podman-exporter $PODMAN_EXPORTER_OPTS
