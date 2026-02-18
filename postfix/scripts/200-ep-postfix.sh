#!/bin/bash

[[ -z $POSTFIX_CDIR ]] && POSTFIX_CDIR="/usr/local/etc/postfix"
[[ -z $POSTFIX_OPTS ]] && POSTFIX_OPTS=""
[[ -z $POSTFIX_MODE ]] && POSTFIX_MODE=active

echo "env config:"
echo "    POSTFIX_CDIR = $POSTFIX_CDIR"
echo "    POSTFIX_OPTS = $POSTFIX_OPTS"
echo "    POSTFIX_MODE = $POSTFIX_MODE"
echo

if [ "$POSTFIX_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[postfix-mode-oos]' sleep 666d
fi

hash_tables="
  table_aliases
  table_check_helo
  table_check_client
  table_debug_peers
  table_recipient_bcc
  table_relay_domains
  table_relay_recipients
  table_sender_bcc
  table_transport
  table_trusted_networks
  table_virtual
  table_vmailbox
"
regexp_tables="
  table_regexp_header_checks
"
for t in $hash_tables; do
  if [ ! -f $POSTFIX_CDIR/$t ]; then
    set -x
    touch $POSTFIX_CDIR/$t
    { set +x; } 2>/dev/null
  fi
  set -x
  postmap $POSTFIX_CDIR/$t
  { set +x; } 2>/dev/null
done

for t in $regexp_tables; do
  if [ ! -f $POSTFIX_CDIR/$t ]; then
    set -x
    touch $POSTFIX_CDIR/$t
    { set +x; } 2>/dev/null
  fi
done

if [ -x /usr/lib/postfix/configure-instance.sh ]; then
  set -x
  /usr/lib/postfix/configure-instance.sh postfix
  { set +x; } 2>/dev/null
fi

set -x
exec postfix -c $POSTFIX_CDIR $POSTFIX_OPTS start-fg
