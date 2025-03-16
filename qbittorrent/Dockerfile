FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update package list and install dependencies
RUN apt-get update && apt-get install -y \
    net-tools \
    qbittorrent-nox \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Expose ports (8080 for Web UI, 6881 for torrent traffic)
EXPOSE 8080 6881 6881/udp

# Create a configuration directory
RUN mkdir -p /config && chmod -R 777 /config

# Remove any existing socket file
RUN rm -f /root/.config/qBittorrent/ipc-socket

# Command to run qBittorrent with Web UI enabled
CMD ["qbittorrent-nox", "--webui-port=8080"]

#echo "IP Address: $(curl --interface wg0 -s http://checkip.amazonaws.com) Country: $(curl -s https://ipinfo.io/$(curl -s http://checkip.amazonaws.com)/country)"
#echo "IP Address: $(curl --interface wg0 -s http://checkip.amazonaws.com) Country: $(curl --interface wg0 -s https://ipinfo.io/$(curl --interface wg0 -s http://checkip.amazonaws.com)/country)"