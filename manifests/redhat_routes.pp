#
# = Define: iproute2::redhat_setup
#
# == Common parameters
#
#  $routes = {"id" : "name"}

define iproute2::redhat_routes(
  $routes_hash
){
  $dev = $name
  $routes = $routes_hash[$dev]

  file { "/etc/sysconfig/network-scripts/route-${dev}":
    ensure  => present,
    content => template('iproute2/etc/sysconfig/network-scripts/route.erb'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }
}
