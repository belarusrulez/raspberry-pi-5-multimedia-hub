# Use the official Ubuntu base image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install OpenVPN, curl, and iproute2 (for the ip command)
RUN apt-get update && apt-get install -y \
    openvpn \
    curl \
    iproute2 \
    && rm -rf /var/lib/apt/lists/*

# Copy your OpenVPN configuration file into the container
COPY ./myvpn.ovpn /etc/openvpn/myvpn.ovpn

# Expose necessary ports (if needed)
EXPOSE 1194/udp

# Command to start OpenVPN client
CMD ["openvpn", "--config", "/etc/openvpn/myvpn.ovpn", "--dev", "tun", "--verb", "5"]