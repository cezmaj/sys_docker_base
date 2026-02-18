#!/bin/bash

[[ -z $REDMINE_SUBURI ]] && REDMINE_SUBURI=""
[[ -z $REDMINE_MODE   ]] && REDMINE_MODE=active

echo "env config:"
echo "    REDMINE_SUBURI = $REDMINE_SUBURI"
echo "    REDMINE_MODE   = $REDMINE_MODE"
echo

if [ "$REDMINE_MODE" = "oos" ]; then
  echo operation mode: out-of-service
  set -x
  exec -a '[redmine-mode-oos]' sleep 666d
fi

if [ ! -d /var/opt/redmine/files ]; then
  set -x
  mkdir -pv /var/opt/redmine/{files,log,tmp/pdf,public/plugin_assets}
  chown -R redmine:redmine /var/opt/redmine/{files,log,tmp,public}
  chmod -R 755 /var/opt/redmine/{files,log,tmp,public}
  { set +ex; } 2>/dev/null
fi

if [ -n $REDMINE_SUBURI ]; then
  echo "Redmine::Utils::relative_url_root = \"$REDMINE_SUBURI\"" >> /usr/local/redmine/config/environment.rb;
fi

set -x
exec thin start -C /usr/local/etc/redmine/thin/thin-redmine.yml
