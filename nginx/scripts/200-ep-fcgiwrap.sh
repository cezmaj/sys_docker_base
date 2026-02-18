#!/bin/bash

[[ -z $FCGIWRAP_PREFORK   ]] && FCGIWRAP_PREFORK=5

echo "env config:"
echo "    FCGIWRAP_PREFORK = $FCGIWRAP_PREFORK"
echo

set -x
exec fcgiwrap -s tcp:127.0.0.1:9012 -c $FCGIWRAP_PREFORK
