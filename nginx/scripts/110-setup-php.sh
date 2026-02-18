#!/bin/bash

[[ -z $NGINX_PHP            ]] && NGINX_PHP=0
[[ -z $NGINX_PHP_UPLOAD_MAX ]] && NGINX_PHP_UPLOAD_MAX=128M

echo "env config:"
echo "    NGINX_PHP            = $NGINX_PHP"
echo "    NGINX_PHP_UPLOAD_MAX = $NGINX_PHP_UPLOAD_MAX"

if [ "$NGINX_PHP" = "yes" -o "$NGINX_PHP" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-php-fpm.conf.disabled /usr/local/etc/supervisord.d/supervisord-php-fpm.conf
  sed -i.setup -e "s/^[;]*post_max_size.*$/post_max_size=$NGINX_PHP_UPLOAD_MAX/" -e "s/^[;]*upload_max_filesize.*$/upload_max_filesize=$NGINX_PHP_UPLOAD_MAX/" /usr/local/etc/php/php.ini
  { set +ex; } 2>/dev/null
fi
