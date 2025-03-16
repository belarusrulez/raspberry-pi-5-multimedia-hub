# Use Ubuntu as base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    net-tools \
    qbittorrent-nox \
    curl \
    wireguard \
    bash-completion \
    vim \
    git \
    htop \
    iproute2 \
    iptables \
    resolvconf \
    && rm -rf /var/lib/apt/lists/*

# Expose ports (8080 for Web UI, 6881 for torrent traffic)
EXPOSE 8080 6881 6881/udp

# Create a configuration directory
RUN mkdir -p /config && chmod -R 777 /config

# Remove any existing socket file to avoid issues
RUN rm -f /root/.config/qBittorrent/ipc-socket

# Copy WireGuard configuration file
COPY ./config/wireguard/wg0.conf /etc/wireguard/wg0.conf

# Copy the IP check script
COPY ./sh/start.sh /usr/local/bin/start.sh

# Make the script executable
RUN chmod +x /usr/local/bin/start.sh

# Command to run the IP check script
CMD ["/usr/local/bin/start.sh"]