class kerberos {

  augeas  { '/etc/krb5.conf - default_realm' :
    context => '/files/etc/krb5.conf/libdefaults',
    changes => 'set default_realm UMICH.EDU',
  }

}
