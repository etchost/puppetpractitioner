class files {

  file { [ '/etc/cron.allow', '/etc/cron.deny'] :
    ensure => file,
    owner  => 'root',
    group  => '0',
    mode   => '0600',
  }

  file_line { 'prevent cron jobs' :
    ensure => present,
    path   => '/etc/cron.deny',
    line   => '*',
  }

  file_line { 'allow root cron jobs' :
    ensure => present,
    path   => '/etc/cron.allow',
    line   => 'root',
  }

  concat { '/etc/motd' :
    owner => 'root',
    group => '0',
    mode  => '0644',
  }

  concat::fragment { 'motd header' :
    target  => '/etc/motd',
    order   => '01',
    content => epp("files/motd_header.epp"),
  }

  concat::fragment { 'motd message' :
    target  => '/etc/motd',
    order   => '99',
    content => "This is the MOTD message\n\n",
  }




}
