#!/bin/bash

[[ -z $OPENLDAP_ID     ]] && OPENLDAP_ID=""
[[ -z $OPENLDAP_CONF   ]] && OPENLDAP_CONF=/usr/local/etc/openldap/slapd${OPENLDAP_ID:+-}${OPENLDAP_ID}.conf
[[ -z $OPENLDAP_URLS   ]] && OPENLDAP_URLS=ldap:///
[[ -z $OPENLDAP_DEBUG  ]] && OPENLDAP_DEBUG=stats
[[ -z $OPENLDAP_ULIMIT ]] && OPENLDAP_ULIMIT="-n 1024"

OPENLDAP_URLS=$(echo $OPENLDAP_URLS|sed 's/,/ /g')

echo "env config:"
echo "    OPENLDAP_ID     = $OPENLDAP_ID"
echo "    OPENLDAP_CONF   = $OPENLDAP_CONF"
echo "    OPENLDAP_URLS   = $OPENLDAP_URLS"
echo "    OPENLDAP_DEBUG  = $OPENLDAP_DEBUG"
echo "    OPENLDAP_ULIMIT = $OPENLDAP_ULIMIT"
echo

if [ ! -f $OPENLDAP_CONF ]; then
  echo ${0##*/}: error: no config file: $OPENLDAP_CONF
  exit 1
fi

set -x
ulimit $OPENLDAP_ULIMIT
slapd -VVV
exec slapd -u ldap -g ldap -f $OPENLDAP_CONF -d $OPENLDAP_DEBUG -h "$OPENLDAP_URLS"
