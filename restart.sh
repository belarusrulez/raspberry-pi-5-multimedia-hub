#!/bin/sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "Script directory: $SCRIPT_DIR"

colima stop

# Create necessary directories
mkdir -p ${SCRIPT_DIR}/mount/wireguard
mkdir -p ${SCRIPT_DIR}/mount/downloads
mkdir -p ${SCRIPT_DIR}/mount/qBittorrent/config
mkdir -p ${SCRIPT_DIR}/mount/jellyfin/config
mkdir -p ${SCRIPT_DIR}/mount/jellyfin/cache
chmod -R 755 ${SCRIPT_DIR}/mount

colima start --cpu 8 --memory 14 --mount /Volumes/2TB/media:/media:w --mount ${SCRIPT_DIR}/mount:/mount:w
docker-compose up -d