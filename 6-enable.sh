#!/bin/bash

set -eux

ip=$(openstack --os-cloud=vexxhost --os-region=ams1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
ssh fedora@${ip} sudo systemctl enable --now avahi-daemon.service

ip=$(openstack --os-cloud=vexxhost --os-region=ca-ymq-1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
ssh fedora@${ip} sudo systemctl enable --now avahi-daemon.service

ip=$(openstack --os-cloud=vexxhost --os-region=sjc1 server show mirror --format json|jq -r ' .addresses.public[]'|grep -v ':')
ssh fedora@${ip} sudo systemctl enable --now avahi-daemon.service

#ip=$(openstack --os-cloud=limestone --os-region=us-dfw-1 server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
#ssh fedora@${ip} sudo systemctl enable --now avahi-daemon.service

ip=$(openstack --os-cloud=limestone --os-region=us-slc server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
ssh fedora@${ip} sudo systemctl enable --now avahi-daemon.service
