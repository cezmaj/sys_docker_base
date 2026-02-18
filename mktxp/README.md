mktxp
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-mktxp-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/mktxp:$V}
    OPTS=(
    --publish $(ipa brsvc1):49090:49090
    --volume /usr/local/etc/$A:/usr/local/etc/mktxp
    )
    INIT=(
     "install -m 755 -o none -g none -v -d /usr/local/etc/$A"
    )
