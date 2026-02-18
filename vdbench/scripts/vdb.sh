#!/bin/bash

if [ "$1" = "-r" ]; then
  ID=vdb-r-10gb
  echo -e "\n$(hostname -s)-$(date +%Y%m%d%H%M)" >> $ID.txt
  vdbench -f /usr/local/etc/vdbench/$ID.conf -o $ID | \
    grep --line-buffered -E 'resp|avg' | \
    sed --unbuffered -e '1p' -e '2p' -e '/avg/!d' | \
    tee -a $ID.txt
elif [ "$1" = "-w" ]; then
  ID=vdb-w-10gb
  echo -e "\n$(hostname -s)-$(date +%Y%m%d%H%M)" >> $ID.txt
  vdbench -f /usr/local/etc/vdbench/$ID.conf -o $ID | \
    grep --line-buffered -E 'resp|avg' | \
    sed --unbuffered -e '1p' -e '2p' -e '/avg/!d' | \
    tee -a $ID.txt
else
  echo "$(basename $0) -r|-w # read,write"
fi
