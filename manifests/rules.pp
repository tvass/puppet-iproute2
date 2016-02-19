#
# = Define: iproute2::rules
#
# This define manages rules.
# Currently only Debian is supported.
#
# == Common parameters
#
#  $rules = {"id" : "name"}

define iproute2::rules(
  $rules = {},
){
  case $::osfamily {
    'Debian': {
      file { '/etc/network/if-up.d/iproute2-002-rules':
        ensure  => present,
        content => template('iproute2/etc/network/if-up.d/iproute2-002-rules-Debian.erb'),
        mode    => '0755',
        owner   => 'root',
        group   => 'root',
      }
    }
    'RedHat': {
      $devs = keys($rules)
      ::iproute2::redhat_rules { $devs :
        rules_hash => $rules,
      }
    }
    default: {
      alert("${::operatingsystem} not supported. No changes done here.")
    }
  }
}
