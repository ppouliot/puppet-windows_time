# == Class: windows_time::service
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
class windows_time::service () inherits windows_time::params{

  service {'w32time':
    ensure => 'running',
  }

}
