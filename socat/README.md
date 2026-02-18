socat
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-socat-ssoldap
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/socat:$V}
    OPTS=(
    --publish $(ipa brsvc1):8099:8080
    --volume /usr/local/etc/$A:/usr/local/etc/socat:ro
    --env SOCAT_ADDR1=TCP4-LISTEN:8080,fork
    --env SOCAT_ADDR2=EXEC:/usr/local/etc/socat/ssoldap.cgi,su-d=none
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
