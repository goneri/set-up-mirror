#!/bin/bash

set -eux

ip=$(openstack --os-cloud=vexxhost --os-region=ams1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
scp 2-start-registry-service-on-node.d/deploy-mirror-on-node.sh fedora@${ip}:
ssh fedora@${ip} bash deploy-mirror-on-node.sh

ip=$(openstack --os-cloud=vexxhost --os-region=ca-ymq-1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
scp 2-start-registry-service-on-node.d/deploy-mirror-on-node.sh fedora@${ip}:
ssh fedora@${ip} bash deploy-mirror-on-node.sh

ip=$(openstack --os-cloud=vexxhost --os-region=sjc1 server show mirror --format json|jq -r ' .addresses.public[]'|grep -v ':')
scp 2-start-registry-service-on-node.d/deploy-mirror-on-node.sh fedora@${ip}:
ssh fedora@${ip} bash deploy-mirror-on-node.sh

#ip=$(openstack --os-cloud=limestone --os-region=us-dfw-1 server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
#scp 2-start-registry-service-on-node.d/deploy-mirror-on-node.sh fedora@${ip}:
#ssh fedora@${ip} bash deploy-mirror-on-node.sh

ip=$(openstack --os-cloud=limestone --os-region=us-slc server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
scp 2-start-registry-service-on-node.d/deploy-mirror-on-node.sh fedora@${ip}:
ssh fedora@${ip} bash deploy-mirror-on-node.sh
