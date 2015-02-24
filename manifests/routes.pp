#
# = Define: iproute2::routes
#
# This define manages routes.
# Currently only Debian is supported.
#
# == Common parameters
#
#  $routes = {"id" : "name"}

define iproute2::routes(
$routes = {},
){
  case $::osfamily {
        'Debian': {
            file { '/etc/network/if-up.d/iproute2-001-routes':
            ensure  => present,
            content => template('iproute2/etc/network/if-up.d/iproute2-001-routes-Debian.erb'),
            mode    => '0755',
            owner   => 'root',
            group   => 'root',
        }
    }
        default: {
            alert("${::operatingsystem} not supported. No changes done here.")
        }
  }
}
