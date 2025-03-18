#!/bin/sh

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "Script directory: $SCRIPT_DIR"

docker-compose down
colima stop
#colima delete

# Create necessary directories
mkdir -p ${SCRIPT_DIR}/mount/wireguard
mkdir -p ${SCRIPT_DIR}/mount/downloads
mkdir -p ${SCRIPT_DIR}/mount/qBittorrent/config
chmod -R 755 ${SCRIPT_DIR}/mount

colima start --mount /Volumes/2TB/media:/media:w --mount ${SCRIPT_DIR}/mount:/mount:w
docker-compose up -d