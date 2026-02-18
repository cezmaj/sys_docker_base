dante
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-dante-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local/is/dante:$V}
    OPTS=(
    --publish $(ipa brint1):1080:1080/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/dante
    --env DANTE_ID=fw1
    )
