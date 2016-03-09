#!/bin/bash -xve

source ~/stackrc;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-create.yaml;

openstack overcloud deploy \
  --templates ~/tripleo-deploy/templates \
  -e ~/tripleo-deploy/environments/swift-scale.yaml;
