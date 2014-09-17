#puppet-iproute2

####Table of Contents

1. [Overview](#overview)
4. [Usage](#usage)
5. [Operating Systems Support](#operating-systems-support)
6. [Development](#development)

##Overview

This module configures iproute2.

##Usage

You have different possibile approaches in the usage of this module.

* Use iproute2::rt_tables defines directly:

        iproute2::rt_tables {
          '223' => 'tab_223',
          '224' => 'tab_224',
        }

* Use the main iproute2 class and the iproute2_hash to configure all :

        class { 'iproute2':
          rt_tables_hash => {
          '223' => 'tab_223',
          '224' => 'tab_224',
            }
        }

* In Hiera, use it like this :

        iproute2::rt_tables" : {
          "223" : "test2",
          "224" : "test3"
        }

##Operating Systems Support

This is tested on these OS:
- Debian 7

##Development

Pull requests (PR) and bug reports via GitHub are welcomed.
