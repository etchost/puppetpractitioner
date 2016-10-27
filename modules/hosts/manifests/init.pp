class hosts {

  # Comment out the target parameter so it will work on Windows, etc.
  # (let the provider sort out where to put the entries)

  resources { 'host' :
     purge => true,
  }

  #host { 'brucetim.puppetlabs.vm':
  #  ensure       => 'present',
  #  host_aliases => ['brucetim'],
  #  ip           => '10.0.1.25',
  #  target       => '/etc/hosts',
  #}

  host { 'localhost':
    ensure       => 'present',
    host_aliases => ['localhost.localdomain', 'localhost6', 'localhost6.localdomain6'],
    ip           => '::1',
    #target       => '/etc/hosts',
  }

  host { 'master.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['master'],
    ip           => '10.0.1.2',
    #target       => '/etc/hosts',
  }

  host { 'student.puppetlabs.vm':
    ensure       => 'present',
    host_aliases => ['student', 'localhost', 'localhost.localdomain', 'localhost4'],
    ip           => '127.0.0.1',
    #target       => '/etc/hosts',
  }

  @@host{ $facts['fqdn']:
    ensure       => present,
    host_aliases => $facts['hostname'],
    ip           => $facts['ipaddress'],
    tag          => 'classroom',
  }

  Host <<| tag == 'classroom' |>>

}
