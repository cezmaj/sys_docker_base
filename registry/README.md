registry
========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-registry-scr
    : ${V:=m.m.p}
    : ${I:=is/registry:$V}
    OPTS=(
    --publish $(ipa brsvc1):5443:8443
    --publish $(ipa brint1):5443:8443
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/registry:ro
    --volume /var/opt/registry/$A:/var/opt/registry
    --env REGISTRY_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/registry/$A"
    )

    # cat /usr/local/etc/cman.d/ap-registry-dcr
    : ${V:=m.m.p}
    : ${I:=is/registry:$V}
    OPTS=(
    --publish $(ipa brsvc1):5442:8443
    --publish $(ipa brint1):5442:8443
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/registry:ro
    --volume /var/opt/registry/$A:/var/opt/registry
    --env REGISTRY_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/registry/$A"
    )

    # cat /usr/local/etc/cman.d/ap-registry-kcr
    : ${V:=m.m.p}
    : ${I:=is/registry:$V}
    OPTS=(
    --publish $(ipa brsvc1):5440:8443
    --volume /usr/local/etc/pki:/usr/local/etc/pki:ro
    --volume /usr/local/etc/$A:/usr/local/etc/registry:ro
    --volume /var/opt/registry/$A:/var/opt/registry
    --env REGISTRY_ID=$API
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o none -g none -v -d /var/opt/registry/$A"
    )
