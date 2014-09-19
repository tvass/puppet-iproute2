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

class iproute2 (
$rt_tables_hash = undef,
$rt_protos_hash = undef
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
}
