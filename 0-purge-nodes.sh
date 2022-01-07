#!/bin/bash

set -eux

function cleanup () {
    openstack --os-cloud=vexxhost --os-region=ams1 server delete mirror || true
    openstack --os-cloud=vexxhost --os-region=ca-ymq-1 server delete mirror || true
    openstack --os-cloud=vexxhost --os-region=sjc1 server delete mirror || true
    openstack --os-cloud=limestone --os-region=us-dfw-1 server delete mirror || true
    openstack --os-cloud=limestone --os-region=us-slc server delete mirror || true
    openstack --os-cloud=vexxhost --os-region=ams1 server delete test-goneri || true
    openstack --os-cloud=vexxhost --os-region=ca-ymq-1 server delete test-goneri || true
    openstack --os-cloud=vexxhost --os-region=sjc1 server delete test-goneri || true
    openstack --os-cloud=limestone --os-region=us-dfw-1 server delete test-goneri || true
    openstack --os-cloud=limestone --os-region=us-slc server delete test-goneri || true
}

cleanup
