icc
===

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-icc
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/icc:$V}
