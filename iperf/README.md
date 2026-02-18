iperf
=====

Deploy
------
cman env:

    # cat /usr/local/etc/cman.d/ap-iperf-nat
    : ${I:=scr.dc.local:5443/is/iperf}
    OPTS=(
    --publish 5201:5201/tcp
    --publish 5201:5201/udp
    --publish 5001:5001/tcp
    --publish 5001:5001/udp
    )
    DOCS="
      --
      $A -r -- iperf3 -V -f M -s          # server
      $A -r -- iperf3 -V -f M -c host     # client (upload)
      $A -r -- iperf3 -V -f M -c host -R  # client (download)
      --
      $A -r -- setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs iperf3 -V -f M -s          # server
      $A -r -- setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs iperf3 -V -f M -c host     # client (upload)
      $A -r -- setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs iperf3 -V -f M -c host -R  # client (download)
      --
      port 5201 - iperf3
      port 5001 - iperf
    "
    
    # cat /usr/local/etc/cman.d/ap-iperf-raw
    : ${I:=scr.dc.local:5443/is/iperf}
    OPTS=(
    --net host
    --privileged
    )
    DOCS="
      --
      $A -r -- iperf3 -V -f M -s          # server
      $A -r -- iperf3 -V -f M -c host     # client (upload)
      $A -r -- iperf3 -V -f M -c host -R  # client (download)
      --
      $A -r -- setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs iperf3 -V -f M -s          # server
      $A -r -- setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs iperf3 -V -f M -c host     # client (upload)
      $A -r -- setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs iperf3 -V -f M -c host -R  # client (download)
      --
      port 5201 - iperf3
      port 5001 - iperf
    "

    # cat /usr/local/etc/cman.d/ap-iperf-server
    : ${I:=scr.dc.local:5443/is/iperf}
    OPTS=(
    --net host
    --privileged
    )
    : ${ARGS:="setpriv --reuid=666 --regid=666 --clear-groups --no-new-privs iperf3 -s"}
    PCMK_OPTS="--group dc6-rg-netmon"
