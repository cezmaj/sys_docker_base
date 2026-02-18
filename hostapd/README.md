hostapd
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-hostapd-p511
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/hostapd:$V}
    OPTS=(
    --network host
    --volume /usr/local/etc/$A:/usr/local/etc/hostapd:ro
    --cap-add net_admin
    --device /dev/rfkill
    --env HOSTAPD_ID=$API
    --env HOSTAPD_OPTS=
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )

    # cat /usr/local/etc/cman.d/lsap
    A=ap-hostapd-p511
    EXEC=1
    ARGS=lsap

    # cat /usr/local/etc/cman.d/lsiw
    A=ap-hostapd-p511
    EXEC=1
    ARGS=lsiw
