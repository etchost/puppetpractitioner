class system::hashadmins {

  require mysql::server

  $mysql_user_defaults = {
    ensure               => present,
    max_queries_per_hour => '600',
  }

  $admins_hash = {
    'brad@localhost'   => {},
    'monica@localhost' => {},
    'luke@localhost'   => {},
    'zack@localhost'   => { max_queries_per_hour => '1200' },
    'ralph@localhost'  => { ensure => absent },
  }

  create_resources('mysql_user', $admins_hash, $mysql_user_defaults)

}
