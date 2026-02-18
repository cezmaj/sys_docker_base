net-snmp
========

Build
-----
cdev env:

    # sed -n "/^if.*net-snmp/,/^fi/p" /usr/local/etc/cdev.env

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-net-snmp
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/net-snmp:$V}
    OPTS=(
    --network host
    --pid host
    --volume /usr/local/etc/$A:/usr/local/etc/net-snmp
    --volume /var/opt/net-snmp/$A:/var/opt/net-snmp
    --env NETSNMPD_OPTS=""
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/net-snmp/$A"
    )
