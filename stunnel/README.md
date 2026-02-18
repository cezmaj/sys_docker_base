stunnel
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-stunnel-smtp-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/stunnel:$V}
    OPTS=(
    --publish 0.0.0.0:5465:5465/tcp
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --env STUNNEL_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
