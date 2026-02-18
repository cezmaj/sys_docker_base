phpmyadmin
==========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-phpmyadmin-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/phpmyadmin:$V}
    OPTS=(
    --publish $(ipa brsvc1):8088:8080
    --volume /usr/local/etc/$A:/usr/local/etc/phpmyadmin:ro
    --volume /var/opt/nginx/ap-nginx-$APN-$API:/var/opt/nginx/ap-nginx-$APN-$API
    --env NGINX_PHP=1
    --env NGINX_ID=ap-nginx-$APN-$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/nginx/ap-nginx-$APN-$API"
    )
