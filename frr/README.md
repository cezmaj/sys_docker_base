frr
===

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-frr-p111
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/frr:$V}
    OPTS=(
    --net host
    --pid host
    --volume /usr/local/etc/$A:/usr/local/etc/frr
    --privileged
    --ulimit nofile=2048:2048
    --env FRR_MGMTD=1
    --env FRR_STATICD=1
    --env FRR_OSPFD=1
    --env FRR_BGPD=1
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
    )

    # cat /usr/local/etc/cman.d/r
    A=ap-frr-p111
    EXEC=1
    ARGS=r
