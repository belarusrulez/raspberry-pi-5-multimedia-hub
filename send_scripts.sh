#!/bin/bash
set -x
set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <IP_ADDRESS>"
  exit 1
fi

IP_ADDRESS=$1
LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"

rsync -av --delete $LOCAL_DIR/ubuntu_scripts belarusrulez@$IP_ADDRESS:/home/belarusrulez