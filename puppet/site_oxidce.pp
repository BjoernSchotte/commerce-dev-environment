Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

class { 'oxidce':
  directory     => '/var/www/oxidce',
  repository    => 'svn',
  version       => 'trunk',
  db_user       => $db_username,
  db_password   => $db_password,
}

exec { "add_vagrant_to_wwwdata":
  command => "sudo adduser vagrant www-data",
}

exec { "chown_docroot":
  command => "sudo chown -R www-data:www-data /var/www/oxidce/",
  require  => Class['oxidce'],
}


oxidce::apache { 'apache.oxidce':
  port     => 80,
  docroot  => '/var/www/oxidce/eshop',
  priority => '10',
  require  => Class['oxidce'],
}
