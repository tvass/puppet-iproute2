#
# = Define: iproute2::redhat_setup
#
# == Common parameters
#
#  $routes = {"id" : "name"}

define iproute2::redhat_rules(
  $rules_hash,
){
  $dev = $name
  $rules = $rules_hash[$dev]

  file { "/etc/sysconfig/network-scripts/rule-${dev}":
    ensure  => present,
    content => template('iproute2/etc/sysconfig/network-scripts/rule.erb'),
    mode    => '0755',
    owner   => 'root',
    group   => 'root',
  }
}
