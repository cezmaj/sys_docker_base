#!/bin/bash

shopt -s nullglob

[[ -z $SSHD_ID   ]] && SSHD_ID=""
[[ -z $SSHD_CONF ]] && SSHD_CONF=/usr/local/etc/ssh/sshd_config${SSHD_ID:+_}${SSHD_ID}

echo "env config:"
echo "    SSHD_ID   = $SSHD_ID"
echo "    SSHD_CONF = $SSHD_CONF"
echo

if [ ! -f $SSHD_CONF ]; then
  echo ${0##*/}: error: no config file: $SSHD_CONF
  exit 1
fi

B=/usr/local/etc/ssh

set -x
if [ ! -f $B/ssh_host_ed25519_key ]; then
  ssh-keygen -t ed25519 -f $B/ssh_host_ed25519_key -N ''
  chmod 600 $B/ssh_host_ed25519_key || true
fi
if [ ! -f $B/ssh_host_rsa_key ]; then
  ssh-keygen -t rsa -b 4096 -f $B/ssh_host_rsa_key -N ''
  chmod 600 $B/ssh_host_rsa_key || true
fi

mkdir -p /run/sshd

if [ -d $B/users ]; then
  cd $B/users
  for u in *; do
    if ! getent passwd $u > /dev/null 2>&1; then
      echo | xargs -L1 -t ./$u
    fi
  done
  cd /
fi

exec /usr/sbin/sshd -D -e -f $SSHD_CONF
