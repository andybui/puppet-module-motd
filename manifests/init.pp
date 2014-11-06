# == Class: motd
#
# Module to manage motd
#
class motd (

) {

  case $::role {
    'puppetmaster': {
      $msg = 'Puppet Master'
    }
    'webserver': {
      $msg = 'Web Server'
    }
    default: {
      fail('I am only meant to work on puppetmasters and webservers.')
    }
  }

  file { '/etc/motd':
    ensure => file,
    content => "${msg}",
    # source => 'puppet:///modules/motd/motd',
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
}
