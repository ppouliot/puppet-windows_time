# Class: windows_time::update_time
#
# This class configures NTP and the Timezone for a windows host
#
# Parameters: none
#
# Actions:
#

class windows_time::update_time() inherits windows_time::params {

  exec {'w32tm_update_time':
    command   => "${::windir}\\system32\\w32tm.exe /config /update",
    before    => Exec['w32tm_resync'],
    logoutput => true,
    timeout   => '60',
  }

}
