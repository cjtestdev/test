#!/bin/bash
#This script updates the apt-repository, installs and test Java Ver 1.8

sudo add-apt-repository ppa:webupdate8team/java
sudo apt-get update
sudo apt-get install -y oracle-java8-installer apt-get install -y oracle-java8-set-default
java -version
