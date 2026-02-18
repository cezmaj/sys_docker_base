openfortivpn
============

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-openfortivpn-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/openfortivpn:$V}
    OPTS=(
    --network host
    --device /dev/ppp
    --volume /usr/local/etc/$A:/usr/local/etc/openfortivpn
    --privileged
    --env OPENFORTIVPN_PROXY=http://10.100.1.11:3128
    --env OPENFORTIVPN_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )
