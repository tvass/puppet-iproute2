#
# = Define: iproute2::rt_protos
#
# This define manages rt_protos.
# Currently only Debian is supported.
#
# == Common parameters
#
#  $rt_protos = {"id" : "name"}

define iproute2::rt_protos(
$rt_protos = {},
){
  case $::osfamily {
        'Debian': {
            file { '/etc/iproute2/rt_protos':
            ensure  => present,
            content => template('iproute2/etc/iproute2/rt_protos-Debian.erb'),
            mode    => '0644',
            owner   => 'root',
            group   => 'root',
        }
    }
        default: {
            alert("${::operatingsystem} not supported. No changes done here.")
        }
  }
}
