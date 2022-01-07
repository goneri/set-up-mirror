#!/bin/bash

set -eux

openstack --os-cloud=vexxhost --os-region=ams1 server create --image 'Fedora-Cloud-Base-35-1.2.x86_64-20211108' --wait --flavor v3-standard-2 --network public --key-name goneri mirror
openstack --os-cloud=vexxhost --os-region=ca-ymq-1 server create --image 'Fedora-Cloud-Base-35-1.2.x86_64-20211108' --wait --flavor v3-standard-2 --network public --key-name goneri mirror
openstack --os-cloud=vexxhost --os-region=sjc1 server create --image 'Fedora-Cloud-Base-35-1.2.x86_64-20211108' --boot-from-volume 50 --wait --flavor v2-highcpu-1 --network public --key-name goneri mirror
##openstack --os-cloud=limestone --os-region=us-dfw-1 server create --image 'Fedora-Cloud-Base-35-1.2.x86_64-20211108' --wait --flavor s1.medium --network "Public Internet" --key-name goneri mirror
openstack --os-cloud=limestone --os-region=us-slc server create --image 'Fedora-Cloud-Base-35-1.2.x86_64-20211108' --wait --flavor c1.hwetest.1 --network "Public Internet" --key-name goneri mirror

