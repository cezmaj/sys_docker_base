kali
====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-kali
    : ${I:=scr.dc.local:5443/is/kali}
    WDIR=/tmp
    OPTS=(
    --workdir $WDIR
    )
    DOCS="
      $A -P
      $A -r
      $A -e id
    "
