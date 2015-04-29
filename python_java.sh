#!/bin/bash

#This script installs Python and Java by running 2 seperate install scripts
chmod +x install_python.sh
chmod +x install_java.sh

#Running scripts
echo Installing Python version 2.7.9 and Java version 1.8
bash install_python279.sh
bash install_java18.sh
