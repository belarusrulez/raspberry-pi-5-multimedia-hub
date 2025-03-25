#!/bin/bash
set -x
set -e

LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)"

if [ -f .env ]; then
    source .env
else
    echo "Error: .env file not found"
    exit 1
fi

# Update the system and install dependencies
sudo apt update -y
sudo apt install -y wireguard wireguard-tools

# Generate client private and public keys
wg genkey | tee client_private.key | wg pubkey > client_public.key
chmod 600 client_private.key  # Set correct permissions on the private key

# Create the WireGuard configuration directory
sudo mkdir -p /etc/wireguard

# Create wg0.conf with environment variables
sudo tee /etc/wireguard/wg0.conf << EOF
[Interface]
PrivateKey = ${WG_PRIVATE_KEY}
Address = ${WG_ADDRESS}
DNS = ${WG_DNS}

[Peer]
PublicKey = ${WG_PEER_PUBLIC_KEY}
PresharedKey = ${WG_PRESHARED_KEY}
AllowedIPs = ${WG_ALLOWED_IPS}
Endpoint = ${WG_ENDPOINT}
PersistentKeepalive = ${WG_PERSISTENT_KEEPALIVE}
EOF

sudo chmod 600 /etc/wireguard/wg0.conf  # Ensure correct permissions on the config file

# Stop and bring down any existing WireGuard interface
sudo systemctl stop wg-quick@wg0 || true
sudo wg-quick down wg0 || true

# Enable and start WireGuard on the client
sudo systemctl enable wg-quick@wg0
sudo systemctl start wg-quick@wg0

# Verify the WireGuard interface is up and running
sudo wg show

# Use curl to check the public IP via the WireGuard interface
if [ "$(curl --interface wg0 -s ipinfo.io/country)" = "${WG_EXPECTED_COUNTRY}" ]; then
    echo "The country is ${WG_EXPECTED_COUNTRY}."
else
    echo "The country is not ${WG_EXPECTED_COUNTRY}."
    exit 1
fi

echo "WireGuard client configuration completed."