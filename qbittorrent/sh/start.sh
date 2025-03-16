#!/bin/sh

# Bring up the WireGuard interface
wg-quick up wg0

# Enable IP forwarding
sysctl -w net.ipv4.ip_forward=1

# Set up NAT (Network Address Translation) for the WireGuard interface
iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE

# Get the public IP address
IP=$(curl -s https://ipinfo.io/ip)
echo "Public IP: $IP"

# Get the country code for the IP address
COUNTRY=$(curl -s https://ipinfo.io/$IP/country)
echo "Country: $COUNTRY"

# Check if the country code is RO (Romania)
if [ "$COUNTRY" = "RO" ]; then
  echo "Connected to WireGuard and IP is from Romania (RO)"
else
  echo "Not connected to WireGuard or IP is not from Romania (RO)"
  exit 1
fi

# Start qBittorrent
qbittorrent-nox --webui-port=8080