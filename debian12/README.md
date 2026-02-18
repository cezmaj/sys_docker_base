debian12
========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-debian12
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/debian12:$V}
    WDIR=/tmp
    OPTS=(
    --workdir /tmp
    $(ls -1 /dev/video* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    $(ls -1 /dev/media* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    )
    DOCS="
      $A -r
      $A -e cmd
    "
