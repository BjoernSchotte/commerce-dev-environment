Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

Package {
  require => Exec['apt-get_update'],
}

class { 'magece':
  directory     => '/var/www/magece',
  repository    => 'svn',
  version       => '1.7',
  db_user       => $db_username,
  db_password   => $db_password,
}

exec { "add_vagrant_to_wwwdata":
  command => "sudo adduser vagrant www-data",
}

exec { "chown_docroot":
  command => "sudo chown -R www-data:www-data /var/www/magece/",
  require  => Class['magece'],
}


magece::apache { 'apache.magece':
  port     => 80,
  docroot  => '/var/www/magece/',
  priority => '10',
  require  => Class['magece'],
}
