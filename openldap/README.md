openldap
========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-openldap-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/openldap:$V}
    OPTS=(
    --publish $(n2a ds):389:389
    --publish $(n2a ds):636:636
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/openldap:ro
    --volume /var/opt/openldap/$A:/var/opt/openldap
    --env OPENLDAP_ID=$API
    --env OPENLDAP_URLS="ldap:///,ldaps:///"
    --env OPENLDAP_DEBUG="stats,stats2,sync"
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o 55 -g 55 -v -d /var/opt/openldap/$A"
    )
    TAGS=pcmk
    PCMK_OPTS="--group dc1-rg-openldap"
