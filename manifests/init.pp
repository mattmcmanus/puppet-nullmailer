class nullmailer(
  $smarthost,
  $protocol = undef,
  $port = undef,
  $user = undef,
  $password = undef
) {
  
  # Install the package
  package {   
    'nullmailer': ensure => installed
  }
  
  package {   
    'postfix': ensure => purged
  }
  
  service {
    'nullmailer': ensure => running
  }
  
  $smarthost_real = $smarthost
  
  if $protocol {
    $protocol_real += $protocol
  } else {
    $protocol_real = 'smtp'
  }
  
  if $port {
    $port_real += "--port=${port}"
  } else {
    $port_real = ''
  }
  
  if $user {
    $user_real += "--user=${user}"
  } else {
    $user_real = ''
  }
  
  if $password {
    $password_real += "--password=${password}"
  } else {
    $password_real = ''
  }
  
  file {
    "/etc/nullmailer/remotes":
      path => "/etc/nullmailer/remotes",
      content  => template("nullmailer/remotes.erb"),
      notify => Service['nullmailer'],
      ensure => present;
  }

}