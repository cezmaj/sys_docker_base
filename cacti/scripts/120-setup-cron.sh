#!/bin/bash

if [ -f /usr/local/etc/cacti/crontab-cacti ]; then
  set -x
  crontab -u none /usr/local/etc/cacti/crontab-cacti
  crontab -u none -l
  { set +ex; } 2>/dev/null
fi
