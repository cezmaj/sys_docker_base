openvpn
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-openvpn-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/openvpn:$V}
    OPTS=(
    --network host
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/openvpn:ro
    --volume /var/opt/openvpn/$A:/var/opt/openvpn:rw
    --privileged
    --tty
    --env OPENVPN_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/openvpn/$A"
     "install -m 755 -o none -g none -v -d /var/opt/openvpn/$A/log"
     "install -m 755 -o none -g none -v -d /var/opt/openvpn/$A/run"
    )
