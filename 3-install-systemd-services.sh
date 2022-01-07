#!/bin/bash

set -eux

ip=$(openstack --os-cloud=vexxhost --os-region=ams1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
scp 3-install-systemd-services.d/refresh-mirror.service  3-install-systemd-services.d/refresh-mirror.timer fedora@${ip}:
ssh fedora@${ip} sudo cp refresh-mirror.service refresh-mirror.timer /etc/systemd/system/

ip=$(openstack --os-cloud=vexxhost --os-region=ca-ymq-1 server show mirror --format json|jq -r '.addresses.public[]'|grep -v ':')
scp 3-install-systemd-services.d/refresh-mirror.service  3-install-systemd-services.d/refresh-mirror.timer fedora@${ip}:
ssh fedora@${ip} sudo cp refresh-mirror.service refresh-mirror.timer /etc/systemd/system/

ip=$(openstack --os-cloud=vexxhost --os-region=sjc1 server show mirror --format json|jq -r ' .addresses.public[]'|grep -v ':')
scp 3-install-systemd-services.d/refresh-mirror.service  3-install-systemd-services.d/refresh-mirror.timer fedora@${ip}:
ssh fedora@${ip} sudo cp refresh-mirror.service refresh-mirror.timer /etc/systemd/system/

#ip=$(openstack --os-cloud=limestone --os-region=us-dfw-1 server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
#scp 3-install-systemd-services.d/refresh-mirror.service  3-install-systemd-services.d/refresh-mirror.timer fedora@${ip}:
#ssh fedora@${ip} sudo cp refresh-mirror.service refresh-mirror.timer /etc/systemd/system/

ip=$(openstack --os-cloud=limestone --os-region=us-slc server show mirror --format json|jq -r '.addresses["Public Internet"][]'|grep -v ':')
scp 3-install-systemd-services.d/refresh-mirror.service  3-install-systemd-services.d/refresh-mirror.timer fedora@${ip}:
ssh fedora@${ip} sudo cp refresh-mirror.service refresh-mirror.timer /etc/systemd/system/
