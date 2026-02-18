#!/bin/bash

[[ -z $GUACD_LOG ]] && GUACD_LOG=info

echo "env config:"
echo "    GUACD_LOG = $GUACD_LOG"

set -x
guacd -v
exec guacd -b 0.0.0.0 -l 4822 -f -L $GUACD_LOG
