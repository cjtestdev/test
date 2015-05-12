#!/bin/bash
#This script updates the apt-repository, installs and test Java Ver 1.8

sudo add-apt-repository ppa:webupdate8team/java -y
sudo apt-get update -y
sudo apt-get install -y oracle-java8-installer -y 
sudo apt-get install -y oracle-java8-set-default -y
java -version
