#!/bin/bash

[[ -z $MONGO_URL ]] && export MONGO_URL=mongodb://mongo:27017/rocketchat
[[ -z $ROOT_URL  ]] && export ROOT_URL=http://localhost:3001
[[ -z $MAIL_URL  ]] && export MAIL_URL=
[[ -z $PORT      ]] && export PORT=3001

echo "env config:"
echo "    MONGO_URL = $MONGO_URL"
echo "    ROOT_URL  = $ROOT_URL"
echo "    MAIL_URL  = $MAIL_URL"
echo "    PORT      = $PORT"
echo

set -x
exec setpriv --reuid=811 --regid=811 --clear-groups --no-new-privs \
  node /usr/local/rocketchat/main.js
