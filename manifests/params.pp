# == Class: windows_time::params
#
# Parameters for the windows_time module
#
# === Parameters
#
# Document parameters here.
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
# === Authors
#
# Peter J. Pouliot <peter@pouliot.net>
#
# === Copyright
#
# Copyright 2015 Peter J. Pouliot, unless otherwise noted.
#
class windows_time::params { 

  $w_ntp_server     = 'pool.ntp.org',
  $w_timezone       = 'UTC',
  $datetime_servers = 'HKLM\Software\Microsoft\Windows\CurrentVersion\DateTime\Servers',
  $w32time_params   = 'HKLM\System\CurrentControlSet\services\W32Time\Parameters',

}
