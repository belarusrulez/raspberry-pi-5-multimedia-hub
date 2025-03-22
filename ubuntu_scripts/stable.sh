#!/bin/bash
set -x
set -e

LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"
sudo ${LOCAL_DIR}/setup_wireguard.sh
sudo ${LOCAL_DIR}/setup_q_bittorrent.sh
