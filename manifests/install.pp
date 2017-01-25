# == Class roles::install
#
# This class is called from roles for install.
#
class roles::install {

  package { $::roles::package_name:
    ensure => present,
  }
}
