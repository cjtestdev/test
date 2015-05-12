#!/bin/bash
#This script updates the apt-repository, installs and test Java Ver 1.8

sudo add-apt-repository ppa:webupd8team/java -y
sudo apt-get --yes --quiet update
sudo apt-get install --yes --quiet oracle-java8-installer 
sudo apt-get install --yes --quiet oracle-java8-set-default
java -version
