netxms-websvc
=============

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-netxms-websvc-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/netxms-websvc:$V}
    OPTS=(
    --publish $(ipa brsvc1):8091:8080/tcp
    --volume /usr/local/etc/ap-$APN-$API:/usr/local/etc/netxms-websvc
    --env NETXMS_PREFIX=dc1-"
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/ap-$APN-$API"
    )
