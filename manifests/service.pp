# == Class roles::service
#
# This class is meant to be called from roles.
# It ensure the service is running.
#
class roles::service {

  service { $::roles::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
