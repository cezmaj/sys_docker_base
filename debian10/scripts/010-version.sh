#!/bin/bash

d=/version.d

if [ -d $d ]; then
  echo version:
  find $d -type f -printf '%T@ %P\n' | sort -n | awk '{print $2}' | \
  while read i; do
    echo "  name: $d/$i"
    cat $d/$i | sed "s/^/    /"
  done
fi
