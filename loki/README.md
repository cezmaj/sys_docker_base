loki
====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-loki-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/loki:$V}
    OPTS=(
    --publish $(ipa brsvc1):3100:3100
    --publish $(ipa brint1):3100:3100
    --volume /usr/local/etc/$A:/usr/local/etc/loki
    --volume /var/opt/loki/$A:/var/opt/loki
    --env LOKI_OPTS=-print-config-stderr
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/loki/$A"
    )
