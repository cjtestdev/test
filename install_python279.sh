#!/bin/bash
# This script installs the python and its dependencies

sudo apt-get --yes --quiet install -y build-essential && sudo apt-get --yes --quiet install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

mkdir -m a=rwx -p /home/installs    
cd ~/home/installs/

#Download and build Python version 2.7.9
wget https://python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
tar -xvf Python-2.7.9.tgz
cd Python-2.7.9
./configure
make
sudo make install

#Test the install was successful
sudo apt-get install -y python-pip
sudo apt-get install -y python-pytest
#py.test --version

cd -
rm -rf Python-2.7.9
