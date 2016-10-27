class profile::base {
  notify { "Hello ${fqdn}": }

  $msg = hiera("message")
  notify { "I have a message for you: ${msg}": }
}
