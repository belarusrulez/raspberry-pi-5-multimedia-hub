# Multimedia Server Setup

A collection of scripts for setting up a complete multimedia server environment on Raspberry Pi running Ubuntu 24.04.2 LTS, including media streaming, torrent downloading, and secure remote access.

## Features

- **Media Streaming**: Jellyfin server for streaming your media collection
- **Torrent Management**: qBittorrent for efficient torrent downloading
- **Secure Remote Access**: WireGuard VPN for secure remote access to your server
- **Storage Management**: NVMe drive mounting and management
- **Automated Setup**: Streamlined installation and configuration scripts

## Prerequisites

- Raspberry Pi 5 (tested on 8GB model)
- Ubuntu 24.04.2 LTS installed on your Raspberry Pi
- SSH access to the target Raspberry Pi
- Sudo privileges on the target Raspberry Pi
- NVMe drive (optional, for storage expansion)
- Minimum 4GB RAM (tested on 8GB model)
- External storage recommended for media files

## Installation

1. Clone this repository:```bash
git clone https://github.com/yourusername/multimedia-server.git
cd multimedia-server
```

2. Make the deployment script executable:
```bash
chmod +x send_scripts.sh
```

3. Deploy the scripts to your Raspberry Pi:
```bash
./send_scripts.sh <RASPBERRY_PI_IP>
```

4. SSH into your Raspberry Pi and run the initialization script:
```bash
cd ubuntu_scripts
chmod +x init.sh
./init.sh
```

## Available Scripts

- `init.sh`: Initial Raspberry Pi setup and configuration
- `setup_jellyfin.sh`: Installs and configures Jellyfin media server
- `setup_q_bittorrent.sh`: Sets up qBittorrent for torrent management
- `setup_wireguard.sh`: Configures WireGuard VPN for secure remote access
- `mount_nvme.sh`: Handles NVMe drive mounting and configuration
- `stable.sh`: Ensures system stability and updates

## Usage

### Setting up Jellyfin
```bash
./setup_jellyfin.sh
```

### Setting up qBittorrent
```bash
./setup_q_bittorrent.sh
```

### Setting up WireGuard VPN
```bash
./setup_wireguard.sh
```

Before running the WireGuard setup script, create a `.env` file in the root directory with the following configuration:

```env
# WireGuard Configuration
WG_PRIVATE_KEY=your_private_key_here
WG_ADDRESS=10.0.0.2/32  # Your client IP address
WG_DNS=1.1.1.1  # DNS server (e.g., Cloudflare's 1.1.1.1)

# Peer (Server) Configuration
WG_PEER_PUBLIC_KEY=server_public_key_here
WG_PRESHARED_KEY=preshared_key_here
WG_ALLOWED_IPS=0.0.0.0/0  # Route all traffic through VPN
WG_ENDPOINT=your.server.com:51820  # Server address and port
WG_PERSISTENT_KEEPALIVE=25  # Keep connection alive every 25 seconds

# VPN Location Verification
WG_EXPECTED_COUNTRY=RO  # Expected country code (e.g., RO for Romania)
```

**Important Security Notes:**
- Keep your `.env` file secure and never commit it to version control
- Ensure the file permissions are restricted: `chmod 600 .env`
- The private key and preshared key should be kept secret

### Mounting NVMe Drive
```bash
./mount_nvme.sh
```

## Performance Considerations

- Raspberry Pi 5 is recommended for optimal performance
- Consider using an external SSD or NVMe drive for media storage
- Monitor system temperature during heavy operations
- Jellyfin transcoding may be limited on Raspberry Pi hardware
- Raspberry Pi 5's improved CPU and GPU performance provides better media handling capabilities

## Security Considerations

- All scripts use `set -e` to stop execution on any error
- WireGuard VPN provides secure remote access
- System updates are performed during initialization
- Proper permissions are set for all services
- Regular system monitoring recommended

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

If you encounter any issues or have questions, please open an issue in the GitHub repository. 

