#!/bin/bash

[[ -z $SPAMASSASSIN_OPTS ]] && SPAMASSASSIN_OPTS="-s null -x -m 5 -u debian-spamd -g debian-spamd -i 0.0.0.0 -A 127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16"
[[ -z $SPAMASSASSIN_MODE ]] && SPAMASSASSIN_MODE=active

echo "env config:"
echo "    SPAMASSASSIN_OPTS = $SPAMASSASSIN_OPTS"
echo "    SPAMASSASSIN_MODE = $SPAMASSASSIN_MODE"
echo

if [ "$SPAMASSASSIN_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[spamassassin-mode-oos]' sleep 666d
fi

set -x
spamd --version
exec spamd $SPAMASSASSIN_OPTS
