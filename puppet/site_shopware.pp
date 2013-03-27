Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

Package {
  require => Exec['apt-get_update'],
}

class { 'shopware':
  directory     => '/var/www/shopware',
  repository    => 'git',
  version       => 'master',
  db_user       => $db_username,
  db_password   => $db_password,
}

exec { "add_vagrant_to_wwwdata":
  command => "sudo adduser vagrant www-data",
}

exec { "chown_docroot":
  command => "sudo chown -R www-data:www-data /var/www/shopware/",
  require  => Class['shopware'],
}


shopware::apache { 'apache.shopware':
  port     => 80,
  docroot  => '/var/www/shopware/',
  priority => '10',
  require  => Class['shopware'],
}
