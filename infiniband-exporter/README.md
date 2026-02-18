infiniband-exporter
===================

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-infiniband-exporter
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/infiniband-exporter:$V}
    OPTS=(
    --publish 9315:9315/tcp
    --device=/dev/infiniband/umad0
    --cap-add=IPC_LOCK
    )
