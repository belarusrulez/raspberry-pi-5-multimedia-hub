FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    qbittorrent-nox \
    && rm -rf /var/lib/apt/lists/*

# Expose ports (8080 for Web UI, 6881 for torrent traffic)
EXPOSE 8080 6881 6881/udp

# Create a configuration directory
RUN mkdir -p /config && chmod -R 777 /config

# Command to run qBittorrent with Web UI enabled
CMD ["qbittorrent-nox", "--webui-port=8080"]
