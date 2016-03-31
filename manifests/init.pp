# == Class: windows_time
#
# Full description of class windows_time here.
#
# === Parameters
#
# [*w_ntp_server*]
#   The name or IP Address of your NTP Server
#
# [*w_timezone*]
#   The Time Zone used on the system
#
# [*datetime_servers*]
#   The Registry key to specify DateTime\Servers
#
# [*w32time_params*]
#   The Registry key to specificy W32Time Parameters

#
# === Examples
#
#  class { 'windows_time':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Peter J. Pouliot <peter@pouliot.net>
#
# === Copyright
#
# Copyright 2015 Peter J. Pouliot, unless otherwise noted.

class windows_time (

  $w_ntp_server     = $windows_time::params::w_ntp_server,
  $w_timezone       = $windows_time::params::w_timezone,
  $datetime_servers = $windows_time::params::datetime_servers
  $w32time_params   = $windows_time::params::w32time_params

) inherits windows_time::params{

  class{'windows_time::timezone':}    ->
  class{'windows_time::service':}     ->
  class{'windows_time::time_peer':}   ->
  class{'windows_time::update_time':} ->
  class{'windows_time::resync':}

}
