fwknop
======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-fwknop
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/fwknop:$V}
    OPTS=(
    --network host
    --volume /usr/local/etc/$A:/usr/local/etc/fwknop
    --volume /run/dbus/system_bus_socket:/run/dbus/system_bus_socket
    )
