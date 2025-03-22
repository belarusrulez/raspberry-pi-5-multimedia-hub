#!/bin/bash
set -x
set -e


echo "TESTED ON UBUNTU 24.04.2 LTS x64"
LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"
sudo ${LOCAL_DIR}/init.sh
sudo ${LOCAL_DIR}/setup_wireguard.sh
sudo ${LOCAL_DIR}/setup_q_bittorrent.sh
sudo ${LOCAL_DIR}/setup_jellyfin.sh
