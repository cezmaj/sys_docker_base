sshd
====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-sshd-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/sshd:$V}
    OPTS=(
    --publish 0.0.0.0:22822:22/tcp
    --volume /usr/local/etc/$A:/usr/local/etc/ssh:ro
    --volume /var/opt/sshd/$A/home:/home
    )

    # cat /usr/local/etc/cman.d/ap-sshd-gitolite-dc5
    : ${V:=m.m.n}
    : ${I:=scr.dc.local:5443/is/sshd:$V}
    OPTS=(
    --publish $(ipa brsvc1):2222:22
    --publish $(ipa brint1):2222:22
    --volume /usr/local/etc/$A:/usr/local/etc/ssh:ro
    --volume /var/opt/sshd/$A/home:/home
    --volume /u01/gitroot:/u01/gitroot
    --env SSHD_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/sshd/$A/home"
    )
