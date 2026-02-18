chartmuseum
===========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-chartmuseum-scm
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/chartmuseum:$V}
    OPTS=(
    --publish $(ipa brsvc1):5448:8080
    --publish $(ipa brint1):5448:8080
    --volume /usr/local/etc/$A:/usr/local/etc/chartmuseum
    --volume /var/opt/chartmuseum/$A:/var/opt/chartmuseum
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/chartmuseum/$A"
    )
