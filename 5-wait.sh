#!/bin/bash

set -eux

ip=$(openstack --os-cloud=vexxhost --os-region=ams1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
while ssh fedora@${ip} systemctl is-active refresh-mirror; do
    sleep 15
done

ip=$(openstack --os-cloud=vexxhost --os-region=ca-ymq-1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
while ssh fedora@${ip} systemctl is-active refresh-mirror; do
    sleep 15
done

ip=$(openstack --os-cloud=vexxhost --os-region=sjc1 server show mirror --format json|jq -r ' .addresses.public[]'|grep -v ':')
while ssh fedora@${ip} systemctl is-active refresh-mirror; do
    sleep 15
done

#ip=$(openstack --os-cloud=limestone --os-region=us-dfw-1 server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
#scp deploy-mirror-on-node.sh fedora@${ip}:
#ssh fedora@${ip} bash deploy-mirror-on-node.sh
#ssh fedora@${ip} sudo systemctl enable refresh-mirror.timer
#ssh fedora@${ip} sudo systemctl enable --now refresh-mirror.timer

ip=$(openstack --os-cloud=limestone --os-region=us-slc server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
while ssh fedora@${ip} systemctl is-active refresh-mirror; do
    sleep 15
done
