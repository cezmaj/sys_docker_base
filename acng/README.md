apt-cacher-ng
=============

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-acng-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/acng:$V}
    OPTS=(
    --publish $(ipa brsvc1):3142:3142
    --publish $(ipa brint1):3142:3142
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --hostname $(hostname -s)
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/cache"
     "install -m 755 -o none -g none -v -d /var/opt/$APN/$A/log"
    )
