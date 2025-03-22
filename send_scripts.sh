#!/bin/bash
set -x
set -e

LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"

rsync -av --delete $LOCAL_DIR/ubuntu_scripts belarusrulez@192.168.0.44:/home/belarusrulez