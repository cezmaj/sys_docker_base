osdev
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-osdev-sync-aosp
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/osdev:$V}
    OPTS=(
    --volume /sw/android/aosp:/sw/android/aosp:rw
    --volume $HOME/.gitconfig:/root/.gitconfig:ro
    --workdir /sw/android/aosp/aosp-mirror
    )

    # cat /usr/local/etc/cman.d/ap-osdev-sync-gos
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/osdev:$V}
    OPTS=(
    --volume /sw/android/aosp:/sw/android/aosp:ro
    --volume /sw/android/gos:/sw/android/gos:rw
    --volume $HOME/.gitconfig:/root/.gitconfig:ro
    --workdir /sw/android/gos/gos-mirror
    )
