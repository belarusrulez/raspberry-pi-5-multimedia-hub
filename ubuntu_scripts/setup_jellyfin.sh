#!/bin/bash
set -x
set -e

# Update the system and install dependencies
sudo apt update -y
sudo apt install -y apt-transport-https software-properties-common

# Add the Jellyfin repository
curl https://repo.jellyfin.org/install-debuntu.sh | sudo bash

# Update the package list and install Jellyfin
sudo apt update -y
sudo apt install -y jellyfin

# Enable and start the Jellyfin service
sudo systemctl enable jellyfin
sudo systemctl start jellyfin

# Verify the service status
sudo systemctl status jellyfin

echo "Jellyfin installation and configuration completed."