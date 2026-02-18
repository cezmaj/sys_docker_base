promtail
========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-promtail-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/promtail:$V}
    OPTS=(
    --publish $(ipa bradm1):9080:9080/tcp
    --publish $(ipa bradm1):1514:1514/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/promtail:ro
    --volume /etc/machine-id:/etc/machine-id:ro
    --volume /var/log:/var/log:rw
    --env PROMTAIL_OPTS="-client.external-labels=_h=$(hostname -s)"
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
