nginx
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-nginx-sys
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/nginx:$V}
    OPTS=(
    --publish $(ipa brsvc1):80:8080
    --publish $(ipa brsvc1):443:8443
    --publish $(ipa brint1):443:8443
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /var/opt/$APN/$A:/var/opt/$APN/$A
    --volume /sw:/var/opt/$APN/$A/html/sw:ro
    --volume /os:/var/opt/$APN/$A/html/os:ro
    --volume /pub/pkb:/var/opt/$APN/$A/html/pkb:ro
    --env NGINX_ID=$A
    --env NGINX_INIT=no
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A"
    )
