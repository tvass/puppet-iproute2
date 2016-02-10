#
# = Define: iproute2::rt_tables
#
# This define manages rt_tables.
# Currently only Debian is supported.
#
# == Common parameters
#
#  $rt_tables = {"id" : "name"}

define iproute2::rt_tables(
  $rt_tables = {},
){
  case $::osfamily {
    'Debian': {
      file { '/etc/iproute2/rt_tables':
        ensure  => present,
        content => template('iproute2/etc/iproute2/rt_tables-Debian.erb'),
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
      }
    }
    'RedHat': {
      file { '/etc/iproute2/rt_tables':
        ensure  => present,
        content => template('iproute2/etc/iproute2/rt_tables-RedHat.erb'),
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
