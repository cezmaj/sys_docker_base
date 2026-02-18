squid
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-squid-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/squid:$V}
    OPTS=(
    --publish $(ipa brsvc1):3128:3128/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --env SQUID_ID=$API
    )
