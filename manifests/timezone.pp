# Class: windows_time::timezone
#
# This class configures NTP and the Timezone for a windows host
#
# Parameters: none
#
# Actions:
#

class windows_time::timezone(
    $timezone   = $windows_time::params::timezone,
    $winpath    = $windows_time::params::winpath,
) inherits windows_time::params {

  exec {'set_time_zone':
    command => "${::windir}\\system32\\tzutil.exe /s \"${::timezone}\"",
    before  => Service['w32time'],
  }

}
