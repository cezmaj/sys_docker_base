mariadb
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-mariadb-cacti-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/mariadb:$V}
    OPTS=(
    --publish $(ipa brsvc1):3306:3306
    --volume /var/opt/mysql/data/$A:/var/opt/mysql/data/$A
    --env MARIADB_DBCL=$A
    --env MARIADB_INIT=0
    )
    INIT=(
      "install -m 755 -o 672 -g 672 -v -d /var/opt/mysql/data/$A"
    )
