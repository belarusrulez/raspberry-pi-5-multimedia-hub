#!/bin/sh
set -e

echo "Bringing up the WireGuard interface..."
wg-quick up wg0

echo "Setting up NAT (Network Address Translation) for the WireGuard interface..."
iptables -t nat -A POSTROUTING -o wg0 -j MASQUERADE

echo "Allowing traffic forwarding through the WireGuard interface..."
iptables -A FORWARD -i wg0 -j ACCEPT
iptables -A FORWARD -o wg0 -j ACCEPT

echo "Routing all traffic through the WireGuard interface..."
ip route add default dev wg0

echo "Getting the country code for the IP address..."
COUNTRY=$(curl --interface wg0 -s https://ipinfo.io/country)

echo "Country code: $COUNTRY"
# Check if the country code is RO (Romania)
if [ "$COUNTRY" = "RO" ]; then
  echo "Country is Romania. Exiting..."
  exit 1
fi

echo "Starting qBittorrent..."
qbittorrent-nox --webui-port=8080