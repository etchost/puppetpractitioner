#class system::iteradmins {

#  include mysql::server

#  Mysql_user = {
#    max_queries_per_hour => '600',
#  }

#  $admins = {
#    'brad'   => {},
#    'monica' => {},
#    'luke'   => {},
#    'zack'   => { max_queries_per_hour => '1200' },
#  }

#  $admins.each |$user, $params| {

#    mysql_user { "$user@localhost":
#      ensure               => present,
#      max_queries_per_hour => $params['max_queries_per_hour'],
#    }

#    user { $user:
#      ensure => present,
      #}

    #}

  #$absent = ['ralph']

  #$absent.each | $user | {

    #mysql_user { "$user@localhost":
      #      ensure => absent,
      #    }

      #    user { $user:
      #      ensure => absent,
      #    }

      #  }
      #
      #}
