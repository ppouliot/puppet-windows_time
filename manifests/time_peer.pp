# Class: windows_time::time_peer
#
# This class configures NTP and the Timezone for a windows host
#
# Parameters: none
#
# Actions:
#

class windows_time::time_peer(
    $timeserver = $windows_time::params::timeserver,
    $timezone   = $windows_time::params::timezone,
    $winpath    = $windows_time::params::winpath,
) inherits windows_time::params {

  exec { 'set_time_peer':
    command   => "${::windir}\\system32\\w32tm.exe /config /manualpeerlist:${::timeserver} /syncfromflags:MANUAL",
    before    => Exec['w32tm_update_time'],
    logoutput => true,
    timeout   => '60',
  }

}
