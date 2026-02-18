postfix
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-postfix-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/postfix:$V}
    OPTS=(
    --publish $(ipa brsvc1):25:25/tcp
    --publish $(ipa brext1):25:25/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --volume /var/opt/$APN/$A:/var/spool/$APN
    --volume /etc/resolv.conf:/var/spool/$APN/etc/resolv.conf:ro
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A/etc"
    )
