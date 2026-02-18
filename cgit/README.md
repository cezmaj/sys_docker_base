cgit
====

Build
-----
cdev env:

    # sed -n '/^if.*cgit/,/^fi/p' /usr/local/etc/cdev.env

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-cgit-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/cgit:$V}
    OPTS=(
    --publish $(ipa brsvc1):8085:8080
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --volume /var/opt/nginx/ap-nginx-$APN-$API:/var/opt/nginx/ap-nginx-$APN-$API
    --volume /scm:/scm:ro
    --env NGINX_CGI=1
    --env NGINX_ID=ap-nginx-$APN-$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/nginx/ap-nginx-$APN-$API"
    )
