jenkins-plugin-manager
======================

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-jenkins-plugin-manager
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/jenkins-plugin-manager:$V}
    OPTS=(
    --volume /tmp:/work
    )
