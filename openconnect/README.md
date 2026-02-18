openconnect
===========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-openconnect-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/openconnect:$V}
    OPTS=(
    --network host
    --volume /usr/local/etc/$A:/usr/local/etc/openconnect
    --privileged
    --env OPENCONNECT_PROXY=http://10.100.1.11:3128
    --env OPENCONNECT_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
