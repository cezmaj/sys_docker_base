zoneminder
==========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-zoneminder-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/zoneminder:$V}
    OPTS=(
    --publish $(ipa brsvc1):8066:8080
    --device /dev/snd
    --device /dev/dri
    $(ls -1 /dev/video* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    $(ls -1 /dev/media* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    --volume /usr/local/etc/$A:/usr/local/etc/zm
    --volume /usr/local/etc/ap-nginx-$APN-$API/php8/php.ini:/usr/local/etc/php8/php.ini
    --volume /var/opt/zoneminder/$A:/var/opt/zoneminder
    --volume /var/opt/nginx/ap-nginx-$APN-$API:/var/opt/nginx/ap-nginx-$APN-$API
    --shm-size=1g
    --group-add audio
    --group-add video
    --env FCGIWRAP_PREFORK=50
    --env NGINX_CGI=1
    --env NGINX_PHP=1
    --env NGINX_ID=ap-nginx-$APN-$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/nginx/ap-nginx-$APN-$API"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A/cache"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A/events"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A/export"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A/images"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A/swap"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A/log"
     "install -m 755 -o 666 -g 666 -v -d /var/opt/zoneminder/$A/tmp"
    )
