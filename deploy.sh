#!/bin/bash -xve

source ~/stackrc;

~/tripleo-common/scripts/tripleo.sh --overcloud-delete;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-create.yaml;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-scale.yaml;
