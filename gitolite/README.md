gitolite
========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-gitolite-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/gitolite:$V}
    OPTS=(
    --publish $(ipa brsvc1):2222:22
    --publish $(ipa bradm1):2222:22
    --volume /usr/local/etc/$A:/usr/local/etc/ssh:rw
    --volume /var/opt/$APN/$A/home:/home
    --volume /scm/dc1/gitroot:/scm/gitroot
    --hostname $(hostname -s)
    --env SSHD_ID=$APN-$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A/users"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A/home"
     "install -m 755 -o 321  -g 321  -v -d /var/opt/$APN/$A/home/git"
    )
