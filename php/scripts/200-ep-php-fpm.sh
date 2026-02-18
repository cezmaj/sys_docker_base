#!/bin/bash

[[ -z $PHPFPM_ID   ]] && PHPFPM_ID=""
[[ -z $PHPFPM_CONF ]] && PHPFPM_CONF=/usr/local/etc/php/php-fpm${PHPFPM_ID:+-}${PHPFPM_ID}.conf

echo "env config:"
echo "    PHPFPM_ID   = $PHPFPM_ID"
echo "    PHPFPM_CONF = $PHPFPM_CONF"
echo

if [ ! -f $PHPFPM_CONF ]; then
  echo error: no config file: $PHPFPM_CONF
  exit 1
fi

set -x
php-fpm --version
exec php-fpm --nodaemonize --fpm-config $PHPFPM_CONF
