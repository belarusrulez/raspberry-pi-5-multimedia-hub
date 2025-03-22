#!/bin/bash
set -x
set -e
# Update the system and upgrade packages
sudo apt-get update -y
sudo apt-get upgrade -y

# Install net-tools for ifconfig
sudo apt-get install net-tools -y

# Clean up unnecessary packages and cached files
sudo apt-get autoremove -y
sudo apt-get clean

# Verify installation
echo "net-tools installation completed and system cleaned up."