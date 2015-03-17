# == Class: windows_time
#
# Full description of class windows_time here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
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

  $w_ntp_server = $windows_time::params::w_ntp_server,
  $w_timezone= $windows_time::params::w_timezone,

) inherits windows_time::params{

  case $osfamily {
    'Windows':{
    {
    default:{
      fail("This module is not suported on ${::osfamily} operating system!")
    }
  }
}
