#!/bin/bash

N=ap-nginx-sys
R=scr.dc.local:5443
I=is/nginx:1.25.5

I=${R}${R:+/}$I

[[ "$1" = "-c" ]] && OPTS="-d --restart=always" || OPTS="-ti --rm"

if [ "$1" = "-c" -o "$1" = "-i" ]; then
  set -ex
  #podman image pull $I
  podman container run $OPTS \
  --publish 80:8080 \
  --volume /vol/v01/var/opt/nginx/$N:/var/opt/nginx/$N \
  --volume /vol/v01/sw:/var/opt/nginx/$N/html/sw:ro \
  --env NGINX_ID=$N \
  --env NGINX_INIT=${NGINX_INIT:-0} \
  --name $N $I ${@:2}
elif [ "$1" = "-r" ]; then
  set -ex
  podman container stop $N
  podman container rm $N
elif [ "$1" = "-cs" ]; then
  set -ex
  cd /etc/systemd/system
  podman generate systemd --new --name $N -f
  systemctl daemon-reload
  systemctl enable --now container-$N.service
elif [ "$1" = "-rs" ]; then
  set -ex
  cd /etc/systemd/system
  systemctl disable --now container-$N.service
  systemctl daemon-reload
elif [ "$1" = "-p" ]; then
  set -ex
  podman image pull $I
else
  echo "$(basename $0) -i [arg] # interactive"
  echo "$(basename $0) -c       # create"
  echo "$(basename $0) -cs      # create service"
  echo "$(basename $0) -r       # remove"
  echo "$(basename $0) -rs      # remove service"
  echo "$(basename $0) -p       # pull"
fi
