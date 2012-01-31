class nullmailer(
  $smarthost,
  $protocol,
  $port,
  $user,
  $password
) {
  
  # Install the package
  package {   
    ['nullmailer']: ensure => installed
  }
  
  if $protocol {
    $smarthost << " "+$protocol
  }
  
  if $port {
    $smarthost << " --port="+$port
  }
  
  if $user {
    $smarthost << " --user="+$user
  }
  
  if $password {
    $smarthost << " --password="+$password
  }
  
  file {
    "/etc/nullmailer/remotes":
      path => "/etc/nullmailer/remotes",
      content  => template("nullmailer/remotes.erb"),
      ensure => present;
  }

}