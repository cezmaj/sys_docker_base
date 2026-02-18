unbound
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-unbound-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/unbound:$V}
    OPTS=(
    --publish $(ipa brsvc1):1053:1053/tcp
    --publish $(ipa brsvc1):1053:1053/udp
    --volume /usr/local/etc/$A:/usr/local/etc/unbound:ro
    --env UNBOUND_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
