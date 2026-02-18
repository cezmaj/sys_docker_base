pgadmin4
========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-pgadmin4-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/pgadmin4:$V}
    OPTS=(
    --publish $(ipa brsvc1):8089:8080
    --volume /usr/local/etc/$A:/usr/local/etc/pgadmin4:ro
    --volume /var/opt/pgadmin4/$A:/var/opt/pgadmin4
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/pgadmin4/$A"
    )
