#!/bin/bash
set -x
set -e

LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"
# Update the system and install qBittorrent-nox
sudo apt-get update -y
sudo apt-get install -y qbittorrent-nox

# Create qBittorrent.conf systemd service file for qBittorrent-nox
sudo mkdir -p /home/belarusrulez/.config/qBittorrent
sudo chown -R belarusrulez:belarusrulez /home/belarusrulez/.config/qBittorrent
cp -f $LOCAL_DIR/files/qBittorrent/qBittorrent.conf /home/belarusrulez/.config/qBittorrent/qBittorrent.conf

# Enable and start the qBittorrent-nox service
sudo systemctl daemon-reload
sudo systemctl enable qbittorrent-nox
sudo systemctl start qbittorrent-nox

# Verify the service status
sudo systemctl status qbittorrent-nox

echo "qBittorrent-nox installation and configuration completed."