# Class: windows_time::resync
#
# This class configures NTP and the Timezone for a windows host
#
# Parameters: none
#
# Actions:
#

class windows_time::resync(
    $timeserver = $windows_time::params::timeserver,
    $timezone   = $windows_time::params::timezone,
    $winpath    = $windows_time::params::winpath,
) inherits windows_time::params {

  exec {'w32tm_resync':
    command   => "${::windir}\\system32\\w32tm.exe /resync /nowait",
    logoutput => true,
    timeout   => '60',
    require   => Exec['w32tm_update_time'],
  }
}
