grafana
=======

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-grafana-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/grafana:$V}
    OPTS=(
    --publish $(ipa brsvc1):3000:3000
    --volume /usr/local/etc/$A:/usr/local/etc/grafana
    --volume /var/opt/grafana/$A:/var/opt/grafana
    )
    INIT=(
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A"
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A/provisioning"
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A/provisioning/access-control"
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A/provisioning/dashboards"
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A/provisioning/datasources"
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A/provisioning/notifiers"
     "install -m 755 -o root -g root -v -d /usr/local/etc/$A/provisioning/plugins"
     "install -m 755 -o 472 -g 472 -v -d /var/opt/grafana/$A"
     "install -m 755 -o 472 -g 472 -v -d /var/opt/grafana/$A/dashboards"
     "install -m 755 -o 472 -g 472 -v -d /var/opt/grafana/$A/dashboards/sys"
    )
