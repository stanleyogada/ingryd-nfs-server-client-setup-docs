#!/bin/bash

# NFS Server Setup Script

# 1. Install NFS Server
sudo apt update
sudo apt install nfs-kernel-server

# 2. Create a Directory to Share
sudo mkdir /shared_directory

# 3. Set Permissions
sudo chown nobody:nogroup /shared_directory
sudo chmod 777 /shared_directory

# 4. Edit Exports File
sudo echo "/shared_directory client_ip(rw,sync,no_subtree_check)" >> /etc/exports
# Replace 'client_ip' with the IP address of your client machine.

# 5. Restart NFS Server
sudo systemctl restart nfs-kernel-server

# Display completion message
echo "NFS Server setup completed successfully."
