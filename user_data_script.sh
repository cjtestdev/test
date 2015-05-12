#!/bin/bash
set -e -x

sudo apt-get --yes --quiet update
sudo apt-get --yes --quiet install git puppet-common

#
# Download puppet conf and install scripts from git repository.
#

#mv /etc/puppet /etc/puppet.orig
git clone https://github.com/cjtestdev/puppet.git puppet
git clone https://github.com/cjtestdev/test.git .

cd test

# Run Install scripts
bash python_java.sh

#
# Run puppet.
#
#puppet apply /etc/puppet/manifests/init.pp
