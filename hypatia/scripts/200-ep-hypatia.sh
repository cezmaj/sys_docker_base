#!/bin/bash

[[ -z $HYPATIA_DATA ]] && HYPATIA_DATA=/var/opt/hypatia

echo "env config:"
echo "    HYPATIA_DATA = $HYPATIA_DATA"
echo

set -x
if [ -x /var/opt/clamav/startup.sh ]; then
  . /var/opt/clamav/startup.sh
fi
hypatia_clamav.sh /var/opt/clamav $HYPATIA_DATA
hypatia_eset.sh $HYPATIA_DATA
hypatia_stalkerware.sh $HYPATIA_DATA
hypatia_targetedthreats.sh $HYPATIA_DATA
hypatia_bloom.sh $HYPATIA_DATA

ls -l $HYPATIA_DATA
