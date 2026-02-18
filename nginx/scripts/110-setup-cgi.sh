#!/bin/bash

[[ -z $NGINX_CGI ]] && NGINX_CGI=0

echo "env config:"
echo "    NGINX_CGI = $NGINX_CGI"

if [ "$NGINX_CGI" = "yes" -o "$NGINX_CGI" = "1" ]; then
  echo
  set -x
  mv -v /usr/local/etc/supervisord.d/supervisord-fcgiwrap.conf.disabled /usr/local/etc/supervisord.d/supervisord-fcgiwrap.conf
  { set +ex; } 2>/dev/null
fi
