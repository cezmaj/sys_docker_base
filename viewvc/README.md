viewvc
======

Build
-----
cdev env:

    # sed -n '/^if.*viewvc/,/^fi/p' /usr/local/etc/cdev.env

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-viewvc-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/viewvc:$V}
    OPTS=(
    --publish $(ipa brsvc1):8086:8080
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --volume /var/opt/nginx/ap-nginx-$APN-$API:/var/opt/nginx/ap-nginx-$APN-$API
    --volume /scm:/scm:ro
    --env NGINX_CGI=1
    --env NGINX_ID=ap-nginx-$APN-$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/nginx/ap-nginx-$APN-$API"
    )
