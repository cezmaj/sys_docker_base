zoneminder
==========

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-sphinx-dcp-platform
    : ${V:=m.m.p}
    : ${I:=scr.dc.local:5443/is/sphinx:$V}
    WDIR=/home/work/doc_dcp_platform
    OPTS=(
    --publish $(ipa brsvc1):8000:8000
    --volume /etc/passwd:/etc/passwd:ro
    --volume $WDIR:/work
    --workdir /work
    --user $(id -u)
    --env HOME=/tmp
    )
