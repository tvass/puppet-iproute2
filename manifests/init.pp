#
# = Class: iproute2
#
# This class installs and manage iproute2 configuration files
#
# == Parameters
#
# [*rt_tables*]
#  Hash. Default undef.
#

# Add rt_tables / rt_protos
class iproute2 (
  $rt_tables_hash = undef,
  $rt_protos_hash = undef,
  $rules_hash  = undef,
  $routes_hash = undef,
){
  if $rt_tables_hash {
    iproute2::rt_tables { 'rt_tables' :
      rt_tables => $rt_tables_hash
    }
  }
  if $rt_protos_hash {
    iproute2::rt_protos { 'rt_protos' :
      rt_protos => $rt_protos_hash
    }
  }

# Create boot script routes
  if $routes_hash {
    iproute2::routes { 'routes' :
      routes => $routes_hash
    }
  }
# Create boot script rules
  if $rules_hash {
    iproute2::rules { 'rules' :
      rules => $rules_hash
    }
  }
}
