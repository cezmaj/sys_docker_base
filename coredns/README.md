coredns
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-coredns-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/coredns:$V}
    OPTS=(
    --publish $(ipa brsvc1     ):53:1053/tcp
    --publish $(ipa brsvc1     ):53:1053/udp
    --publish $(ipa brint1     ):53:1053/tcp
    --publish $(ipa brint1     ):53:1053/udp
    --publish $(ipa brint1:dns1):53:1053/tcp
    --publish $(ipa brint1:dns1):53:1053/udp
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --env COREDNS_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
