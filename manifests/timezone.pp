# Class: windows_time::timezone
#
# This class configures NTP and the Timezone for a windows host
#
# Parameters: none
#
# Actions:
#

class windows_time::timezone(){

  exec {'set_time_zone':
    command => "${::windir}\\system32\\tzutil.exe /s \"${windows_time::timezone}\"",
    before  => Service['w32time'],
  }

}
