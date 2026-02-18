certbot
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-certbot-www
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/certbot:$V}
    OPTS=(
    --volume /usr/local/etc/ap-letsencrypt:/etc/letsencrypt
    --volume /var/opt/letsencrypt/ap-letsencrypt/lib:/var/lib/letsencrypt
    --volume /var/opt/letsencrypt/ap-letsencrypt/log:/var/log/letsencrypt
    --volume /var/opt/nginx/ap-nginx-sys/html:/webroot
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/ap-letsencrypt"
     "install -m 755 -o root -g root -v -d /var/opt/letsencrypt/ap-letsencrypt/lib"
     "install -m 755 -o root -g root -v -d /var/opt/letsencrypt/ap-letsencrypt/log"
    )
