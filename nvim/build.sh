#!/bin/sh

ansible-galaxy install -r ansible/roles/requirements.yml -p ansible/playbooks/docker
echo "$OMNIDAPPS_PASS" | docker login -u "$OMNIDAPPS_USER" --password-stdin
packer build alpine.json
