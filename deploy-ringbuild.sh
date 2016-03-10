#!/bin/bash -xve

source ~/stackrc;

~/tripleo-common/scripts/tripleo.sh --overcloud-delete;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-ringbuild-create.yaml;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-ringbuild-scale-step-1.yaml;

echo "Copy the ring over to the new node and then run"

echo "openstack overcloud deploy
  --templates ~/tripleo-deploy/templates
  -e ~/tripleo-deploy/environments/swift-ringbuild-scale-step-1.yaml;";
