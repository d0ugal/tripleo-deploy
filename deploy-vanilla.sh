#!/bin/bash -xve

source ~/stackrc;

~/tripleo-common/scripts/tripleo.sh --overcloud-delete;

openstack overcloud deploy \
  -e ~/tripleo-deploy/environments/swift-vanilla-create.yaml;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-vanilla-scale.yaml;

echo "Copy the ring over to the new node and deploy again"
