class review ( Pattern[/[a-z]{3,8}/] $user = 'review', ) {

  file { '/etc/shells' :
    ensure   => 'file',
    source   => 'puppet:///modules/review/shells',
  }

  #file { '/etc/motd' :
  #  ensure   => 'file',
  #  content  => template('review/motd.erb'),
  #  }

  file { '/etc/motd' :
    ensure  => 'file',
    content => epp('review/motd.epp'),
  }

  user { $user :
    ensure  => 'present',
    shell   => '/bin/csh',
  }
}

