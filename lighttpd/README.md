lighttpd
========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-lighttpd-sys
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/lighttpd:$V}
    OPTS=(
    --publish $(ipa brsvc1):80:8080
    --publish $(ipa brsvc1):443:8443
    --publish $(ipa brint1):443:8443
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --volume /var/opt/$APN/$A:/var/opt/$APN/$A
    --env LIGHTTPD_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A"
    )
