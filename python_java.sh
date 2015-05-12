#!/bin/bash

#This script installs Python and Java by running 2 separate install scripts
chmod +x install_python279.sh
chmod +x install_java18.sh

#Running scripts
echo Installing Python version 2.7.9 and Java version 1.8
bash install_python279.sh
bash install_java18.sh
