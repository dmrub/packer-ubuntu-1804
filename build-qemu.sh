#!/bin/bash

THIS_DIR=$( (cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P) )

set -eux

ARGS=(-on-error=ask)

cd "$THIS_DIR"
vagrant box remove 'file://builds/libvirt-ubuntu1804.box' || true
PACKER_LOG=1 packer build --only=qemu "${ARGS[@]}" ubuntu1804.json
vagrant up libvirt --provider=libvirt
