#!/bin/bash

set -x
ln -snfv /var/opt/tomcat/work/context.xml /var/opt/tomcat/conf/

mkdir -p /var/opt/tomcat/work/{cache,files,plugins,logs}
chown tomcat /var/opt/tomcat/work/{cache,files,plugins,logs}

cat << EOF > /as-root/index.html
<html>
  <head> <meta http-equiv="refresh" content="0;url=/hmdm/"> </head>
<body>
</body>
</html>
EOF

cat /as-root/index.html
