netxms-web
==========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-netxms-web-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/netxms-web:$V}
    OPTS=(
    --publish $(ipa brsvc1):8090:8080/tcp
    --volume /var/opt/tomcat/ap-tomcat-$APN-$API/work:/var/opt/tomcat/work:rw
    --env NETXMS_PREFIX=dc1-
    --env JAVA_OPTS="-Dnxmc.server=p111:4701 -Dnxmc.logfile=/tmp/nxmc.log"
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /var/opt/tomcat/ap-tomcat-$APN-$API"
     "install -m 755 -o 91 -g 91 -v -d /var/opt/tomcat/ap-tomcat-$APN-$API/work"
    )
