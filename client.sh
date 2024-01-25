#!/bin/bash

# NFS Client Setup Script

# 1. Install NFS Client
sudo apt update
sudo apt install nfs-common

# 2. Create a Local Mount Point
sudo mkdir /mnt/nfs_share

# 3. Mount NFS Share
sudo mount server_ip:/shared_directory /mnt/nfs_share
# Replace 'server_ip' with the IP address of your NFS server.

# 4. Install autofs
sudo apt install autofs

# 5. Configure Autofs
sudo echo "/mnt /etc/auto.nfs_share" >> /etc/auto.master

# Create /etc/auto.nfs_share
sudo echo "nfs_share -fstype=nfs,rw,sync,no_subtree_check server_ip:/shared_directory" >> /etc/auto.nfs_share
# Replace 'server_ip' with the IP address of your NFS server.

# Restart autofs
sudo systemctl restart autofs

# Display completion message
echo "NFS Client setup completed successfully."
