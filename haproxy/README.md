haproxy
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-haproxy-www
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/haproxy:$V}
    OPTS=(
    --publish $(ipa brext1:orion):80:8080/tcp
    --publish $(ipa brext1:orion):443:8443/tcp
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/haproxy:ro
    --env HAPROXY_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )

    # cat /usr/local/etc/cman.d/ap-haproxy-portal-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/haproxy:$V}
    OPTS=(
    --publish $(n2a lbe1i):5501:5501
    --publish $(n2a lbe1i):9101:9101
    --publish $(n2a lbe1i):9201:9201
    --publish $(n2a lbe1i):9301:9301
    --publish 0.0.0.0:5511:5511
    --volume /usr/local/etc/$A:/usr/local/etc/haproxy:ro
    --env HAPROXY_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
    TAGS=pcmk
    PCMK_OPTS="--group dc1-rg-haproxy-portal"
