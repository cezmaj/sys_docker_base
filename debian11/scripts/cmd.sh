#!/bin/bash

_ID=${0##*/}

echo "$_ID: start: $(date '+%Y-%m-%d %H:%M:%S')"

if [ -d /cmd.d ]; then
  for i in /cmd.d/*.sh; do
    if [ -x $i ]; then
      echo
      echo "$_ID: source: $i"
      source $i
      { set +ex; } 2>/dev/null
    fi
  done
fi

echo
echo "$_ID: end: $(date '+%Y-%m-%d %H:%M:%S')"
