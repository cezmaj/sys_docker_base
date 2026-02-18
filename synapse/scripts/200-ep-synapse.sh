#!/bin/bash

set -x

if [ -f /usr/local/synapse/bin/synapse_homeserver ]; then
  exec setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs \
	synapse_homeserver --config-path=/usr/local/etc/synapse/homeserver.yaml
elif [ -f /opt/venvs/matrix-synapse/bin/python ]; then
  exec setpriv --reuid=matrix-synapse --clear-groups --no-new-privs \
	/opt/venvs/matrix-synapse/bin/python -m synapse.app.homeserver \
	--config-path=/usr/local/etc/synapse/homeserver.yaml
fi
