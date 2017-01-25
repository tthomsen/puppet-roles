# == Class roles::params
#
# This class is meant to be called from roles.
# It sets variables according to platform.
#
class roles::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'roles'
      $service_name = 'roles'
    }
    'RedHat', 'Amazon': {
      $package_name = 'roles'
      $service_name = 'roles'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
