Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

class { 'oxidce':
  directory     => '/var/www/oxidce',
  repository    => 'svn',
  version       => 'trunk',
  db_user       => 'oxidce',
  db_password   => 'oxidce',
}

oxidce::apache { 'apache.oxidce':
  port     => 80,
  docroot  => '/var/www/oxidce/eshop',
  priority => '10',
  require  => Class['oxidce'],
}
