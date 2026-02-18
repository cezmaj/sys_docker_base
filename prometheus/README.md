prometheus
==========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-prometheus-dc1
    PROMETHEUS_OPTS="
    --storage.tsdb.path=/var/opt/prometheus/data
    --storage.tsdb.retention.time=30d
    --storage.tsdb.retention.size=150GB
    --web.page-title=dc1
    --web.external-url=/dc1/prometheus/
    --web.enable-lifecycle
    --web.enable-admin-api
    --log.level=debug
    "

    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/prometheus:$V}
    OPTS=(
    --publish $(ipa brsvc1):9090:9090
    --volume /usr/local/etc/$A:/usr/local/etc/$APN
    --volume /var/opt/$APN/$A:/var/opt/$APN
    --env PROMETHEUS_OPTS="$(echo $PROMETHEUS_OPTS)"
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /var/opt/$APN/$A"
    )
