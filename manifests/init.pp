# Class: roles
# ===========================
#
# Full description of class roles here.
#
# Parameters
# ----------
#
# * `sample parameter`
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
class roles (
  $package_name = $::roles::params::package_name,
  $service_name = $::roles::params::service_name,
) inherits ::roles::params {

  # validate parameters here

  class { '::roles::install': } ->
  class { '::roles::config': } ~>
  class { '::roles::service': } ->
  Class['::roles']
}
