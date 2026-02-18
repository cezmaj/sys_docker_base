thunderbird
===========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-thunderbird-dc1
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/thunderbird:$V}
    OPTS=(
    --net host
    --device /dev/snd
    --device /dev/dri
    $(ls -1 /dev/video* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    $(ls -1 /dev/media* 2>/dev/null|awk '{printf "--device %s:%s ",$1,$1}')
    --volume /tmp/.X11-unix/:/tmp/.X11-unix/
    --volume /run/user/$(id -u $USER):/run/user/$(id -u $USER)
    --volume /run/dbus/system_bus_socket:/run/dbus/system_bus_socket
    --volume /etc/passwd:/etc/passwd:ro
    --volume $HOME:$HOME
    --user $(id -u)
    --group-add audio
    --group-add video
    --workdir $HOME
    --env HOME=$HOME
    --env DISPLAY=$DISPLAY
    --env PULSE_SERVER=unix:/run/user/$(id -u $USER)/pulse/native
    )
