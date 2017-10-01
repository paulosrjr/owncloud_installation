<?php
$CONFIG = array (
  'instanceid' => 'oc4ob6tt62ei',
  'passwordsalt' => '7gqAxOwY9N6po3xmy9bC8ZheofHqFI',
  'secret' => 'yI+r1+ozs/xD3Uh5H0BVk2mSv5flA+WSnwt/+Mfam61BGBH8',
  'trusted_domains' => 
  array (
    0 => '{{ ansible_play_hosts[0] }}:8080',
  ),
  'datadirectory' => '/var/www/html/data',
  'overwrite.cli.url' => 'http://{{ ansible_play_hosts[0] }}:8080',
  'dbtype' => 'mysql',
  'version' => '10.0.3.3',
  'dbname' => 'owncloud',
  'dbhost' => 'mysql_owncloud',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'owncloud',
  'dbpassword' => 'mypasswordtest',
  'logtimezone' => 'UTC',
  'installed' => true,
);
