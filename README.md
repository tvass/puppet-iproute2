# puppet-iproute2

  Work in progress.

#### Table of Contents

1. [Overview](#overview)
4. [Usage](#usage)
5. [Operating Systems Support](#operating-systems-support)
6. [Development](#development)

## verview

This module configures iproute2.

## Usage

You have different possibile approaches in the usage of this module.

* Use iproute2::rt_tables defines directly:

        iproute2::rt_tables {
          '223' => 'isp1',
          '224' => 'isp2',
        }

* Use the main iproute2 class and the iproute2_hash to configure all :

        class { 'iproute2':
          rt_tables_hash => {
          '223' => 'isp1',
          '224' => 'isp2',
            }
        }

* In Hiera, use it like this :

        iproute2::rt_tables" : {
          "223" : "isp1",
          "224" : "isp2"
        }

### Route and Rule Configuration

For routes and rules there are two methods of invocation of the module due to differences in how RedHat and Debian store the configurations on disk. RedHat uses a per device configuration while Debian has a unified configuration.

### Debian

* Add routes :

         routes_hash => [
          {'network' => '1.2.3.0/24', 'gateway' => '10.0.0.1', 'table' => 'isp1'},
          {'network' => '1.2.4.0/24', 'gateway' => '10.0.0.2', 'table' => 'isp2'}
         ]

* Add rules :

        rules_hash => [{'from' => '1.2.3.4', 'to' => '0.0.0.0/0', 'table' => 'isp1', 'priority' => '1000' }],


### RedHat

You need to specify the interface/dev as a top level key in the hash

* add routes :

         routes_hash => [
          'eth0' => [ {'network' => '1.2.3.0/24', 'gateway' => '10.0.0.1', 'table' => 'isp1'},
                      {'network' => '1.2.4.0/24', 'gateway' => '10.0.0.2', 'table' => 'isp2'}
                    ],
          'eth1' => [ {'network' => '1.2.3.0/24', 'gateway' => '10.0.0.1', 'table' => 'isp1'},
                      {'network' => '1.2.4.0/24', 'gateway' => '10.0.0.2', 'table' => 'isp2'}
                    ]
          ]

* Add rules :

        rules_hash => [
          'eth0' => [{'from' => '1.2.3.4', 'to' => '0.0.0.0/0', 'table' => 'isp1', 'priority' => '1000' } ]
        ]


## Operating Systems Support

This is tested on these OS:
- Debian 7/8, Red Hat, Scientific Linux

## Development

Pull requests (PR) and bug reports via GitHub are welcomed.
