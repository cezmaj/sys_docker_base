go
==

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-go
    : ${V:=latest}
    : ${I:=scr.dc.local:5443/is/go:$V}
    WDIR=/tmp
    OPTS=(
    )
