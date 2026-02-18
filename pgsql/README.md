pgsql
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-pgsql-mca-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/pgsql:$V}
    OPTS=(
    --publish $(n2a dbm1i):5402:5432
    --publish $(n2a dbm1r):5402:5432
    --volume /var/opt/$APN/$A:/var/opt/$APN/data/$A
    --env PGSQL_INIT=no
    --env PGSQL_DBCL=$A
    --env PGSQL_DB=mca
    )
    INIT=(
     "install -m 755 -o 26 -g 26 -v -d /var/opt/$APN/$A"
     "install -m 700 -o 26 -g 26 -v -d /var/opt/$APN/$A/${V%.*}"
    )
    TAGS=pcmk
    PCMK_OPTS="--group dc1-rg-pgsql-mca"
