# Class: windows_time::ntp
#
# This class configures NTP and the Timezone for a windows host
#
# Parameters: none
#
# Actions:
#

class windows_time::ntp(
    $timeserver = $windows_time::params::timeserver,
    $timezone   = $windows_time::params::timezone,
    $winpath    = $windows_time::params::winpath,
) inherits windows_time::params {

  exec {'set_time_zone':
    command => "${::windir}\\system32\\tzutil.exe /s \"${::timezone}\"",
    before  => Service['w32time'],
  }

  service { 'w32time':
    ensure => 'running',
    enable => true,
    before => Exec['set_time_peer'],
  }

  exec { 'set_time_peer':
    command   => "${::windir}\\system32\\w32tm.exe /config /manualpeerlist:${::timeserver} /syncfromflags:MANUAL",
    before    => Exec['w32tm_update_time'],
    logoutput => true,
    timeout   => '60',
  }

  exec {'w32tm_update_time':
    command   => "${::windir}\\system32\\w32tm.exe /config /update",
    before    => Exec['w32tm_resync'],
    logoutput => true,
    timeout   => '60',
  }

  exec {'w32tm_resync':
    command   => "${::windir}\\system32\\w32tm.exe /resync /nowait",
    logoutput => true,
    timeout   => '60',
    require   => Exec['w32tm_update_time'],
  }
}
