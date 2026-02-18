#!/bin/bash

N=ap-nginx-sys
R=scr.dc.local:5443
I=is/nginx:1.25.5

I=${R}${R:+/}$I

[[ "$1" = "-c" ]] && OPTS="-d --restart=always" || OPTS="-ti --rm"

if [ "$1" = "-c" -o "$1" = "-i" ]; then
  set -ex
  #docker image pull $I
  docker container run $OPTS \
  --publish 80:8080 \
  --volume /usr/local/etc/pki:/usr/local/etc/pki:ro \
  --volume /var/opt/nginx/$N:/var/opt/nginx/$N \
  --env NGINX_ID=$N \
  --env NGINX_INIT=${NGINX_INIT:-0} \
  --name $N $I ${@:2}
elif [ "$1" = "-r" ]; then
  set -ex
  docker container stop $N
  docker container rm $N
elif [ "$1" = "-p" ]; then
  set -ex
  docker image pull $I
else
  echo "$(basename $0) -i [arg] # interactive"
  echo "$(basename $0) -c       # create"
  echo "$(basename $0) -r       # remove"
  echo "$(basename $0) -p       # pull"
fi
