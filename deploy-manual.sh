#!/bin/bash -xve

source ~/stackrc;

~/tripleo-common/scripts/tripleo.sh --overcloud-delete;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-manual-create.yaml;

echo "Setup the ring manually."

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-manual-scale.yaml;

echo "Copy the ring over to the new node"
