#!/bin/bash

THIS_DIR=$( (cd "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P) )

set -eux

cd "$THIS_DIR"
vagrant box remove 'file://builds/virtualbox-ubuntu1804.box' || true
packer build --only=virtualbox-iso ubuntu1804.json
vagrant up virtualbox --provider=virtualbox
