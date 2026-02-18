cacti
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-cacti-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/cacti:$V}
    OPTS=(
    --dns $(ipa brsvc1)
    --publish $(ipa brsvc1):8091:8080
    --volume /usr/local/etc/$A:/usr/local/etc/$APN:ro
    --volume /usr/local/etc/ap-nginx-$APN-$API/php8/php.ini:/usr/local/etc/php8/php.ini:ro
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --volume /var/opt/$APN/$A/plugins:/usr/local/cacti/plugins
    --volume /var/opt/nginx/ap-nginx-$APN-$API:/var/opt/nginx/ap-nginx-$APN-$API
    --hostname nms2
    --ip=10.88.88.20
    --env NGINX_CGI=0
    --env NGINX_PHP=1
    --env NGINX_ID=ap-nginx-$APN-$API
    )
    INIT=(
     "install -m 0755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 0775 -o root -g root -d /var/opt/nginx/ap-nginx-$APN-$API"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/csrf"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/rra"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/log"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/cache"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/cache/boost"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/cache/mibcache"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/cache/realtime"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/cache/spikekill"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/scripts"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/resource"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/resource/script_queries"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/resource/script_server"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/resource/snmp_queries"
     "install -m 0775 -o none -g none -d /var/opt/$APN/$A/plugins"
     "ln -snfv /usr/local/cacti/include /var/opt/$APN/$A"
     "ln -snfv /usr/local/cacti/lib /var/opt/$APN/$A"
    )
