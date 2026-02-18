<?php

$config->custom->debug['level'] = 255;
$config->custom->debug['syslog'] = false;
$config->custom->debug['file'] = '/tmp/pla_debug.log';

$servers = new Datastore();

$servers->newServer('ldap_pla');
$servers->setValue('server','name','auth.dc.local');
$servers->setValue('server','host','auth.dc.local');
$servers->setValue('server','port',389);
$servers->setValue('login','anon_bind',true);
$servers->setValue('login','bind_id','');
$servers->setValue('login','bind_pass','');
$servers->setValue('server','tls',false);

?>
