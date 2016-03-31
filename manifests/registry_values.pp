# == Class: windows_time::registry_values
#
# Parameters for the windows_time module
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
#
# === Authors
#
# Peter J. Pouliot <peter@pouliot.net>
#
# === Copyright
#
# Copyright 2015 Peter J. Pouliot, unless otherwise noted.
#
class windows_time::service (){

  registry_key{[ $windows_time::datetime_servers, $windows_time::w32time_params]:
    ensure => present,
  }

  registry::value { 'DateTime Servers 0'
    key   => $windows_time::datetime_servers,
    value => '0',
    data => $windows_time::w_ntp_server,
  }
  registry::value { 'DateTime Servers Default':
    key   => $windows_time::datetime_servers,
    value => '(Default)',
    data  => '0',
  }
  registry::value { 'W32Time Parameters':
    key   => $windows_time::w32time_parameters,
    value => 'NtpServer',
    data  => $windows_time::w_ntp_server,
  }

}
