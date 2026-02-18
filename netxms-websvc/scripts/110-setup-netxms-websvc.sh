#!/bin/bash

[[ -z $NETXMS_PREFIX ]] && NETXMS_PREFIX=""

echo "env config:"
echo "    NETXMS_PREFIX = $NETXMS_PREFIX"
echo

if [ "$NETXMS_PREFIX" != "" ]; then
  set -x
  mv -v /as-apps/netxms-websvc.war /as-apps/${NETXMS_PREFIX}netxms-websvc.war
  { set +ex; } 2>/dev/null
fi

set -x
cat << EOF > /as-root/index.html
<html>
  <head> <meta http-equiv="refresh" content="0;url=/${NETXMS_PREFIX}netxms-websvc/"> </head>
<body>
</body>
</html>
EOF

cat /as-root/index.html
