#!/bin/bash
set -x
set -e

LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"
# Update the system and install dependencies
sudo apt update -y
sudo apt install -y wireguard wireguard-tools

# Generate client private and public keys
wg genkey | tee client_private.key | wg pubkey > client_public.key
chmod 600 client_private.key  # Set correct permissions on the private key

# Create the WireGuard configuration directory
sudo mkdir -p /etc/wireguard

# Client configuration (replace placeholders with your actual values)
cp -f $LOCAL_DIR/files/wireguard/wg0.conf /etc/wireguard/wg0.conf
chmod 600 /etc/wireguard/wg0.conf  # Ensure correct permissions on the config file

# Optionally stop and bring down the existing WireGuard interface
sudo wg-quick up wg0
sudo systemctl stop wg-quick@wg0
sudo wg-quick down wg0

# Enable and start WireGuard on the client
sudo systemctl enable wg-quick@wg0
sudo systemctl start wg-quick@wg0

# Verify the WireGuard interface is up and running
sudo wg show

# Use curl to check the public IP via the WireGuard interface
curl --interface wg0 ifconfig.me

echo "WireGuard client configuration completed."