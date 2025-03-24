#!/bin/bash
set -e
set -x
#sudo apt update
#sudo apt install exfatprogs -y
#sudo mkfs.exfat /dev/nvme0n1
#sudo mkdir -p /mnt/nvme
#sudo mount -t exfat -o umask=0000 /dev/nvme0n1 /mnt/nvme
#echo 'UUID=FFE6-D58F /mnt/nvme exfat defaults,umask=0000 0 0' | sudo tee -a /etc/fstab
#sudo reboot


DEVICE=$(lsblk -o NAME,SIZE | grep '1.9T' | awk '{print $1}')
sudo apt update
sudo apt install exfatprogs -y
sudo mkfs.exfat /dev/$DEVICE
sudo mkdir -p /mnt/nvme
sudo mount -t exfat -o umask=0000 /dev/$DEVICE /mnt/nvme
UUID=$(sudo blkid /dev/$DEVICE | awk -F'\"' '{print $2}')
echo "UUID=$UUID /mnt/nvme exfat defaults,umask=0000 0 0" | sudo tee -a /etc/fstab
sudo reboot