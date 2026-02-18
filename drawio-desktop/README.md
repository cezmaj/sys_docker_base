drawio-desktop
==============

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-drawio-dcp-platform
    : ${V=m.m.p}
    : ${I:=scr.dc.local:5443/is/drawio-desktop:$V}
    [ -z $DISPLAY ] && DISPLAY=:1
    WDIR=/home/work/doc_dcp_platform
    OPTS=(
    --cap-add SYS_ADMIN
    --security-opt apparmor=unconfined
    --device /dev/dri
    --volume /tmp/.X11-unix/:/tmp/.X11-unix/
    --volume /run/dbus/system_bus_socket:/run/dbus/system_bus_socket
    --volume /etc/passwd:/etc/passwd:ro
    --volume $WDIR/doc/drawio:/work
    --workdir /work
    --user $(id -u)
    --env HOME=/tmp
    --env DISPLAY=$DISPLAY
    )
    DOCS="
      $A -r
      GTK_THEME=Adwaita:white drawio [file]
      GTK_THEME=Adwaita:dark  drawio [file]
    "
