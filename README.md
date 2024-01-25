# INGRYD-NFS-SERVER-CLIENT-SETUP-DOCS

# Setting Up NFS Server and Client - Documentation

## Introduction

This documentation provides step-by-step instructions for setting up an NFS (Network File System) server and client. NFS allows sharing files between systems on a network, making it a convenient solution for file storage and sharing.

**Author: Stanley Chinedu Ogada**

### Table of Contents

1. [Prerequisites](#1-prerequisites)
2. [Setting Up NFS Server](#2-setting-up-nfs-server)
3. [Configuring NFS Server](#3-configuring-nfs-server)
4. [Setting Up NFS Client](#4-setting-up-nfs-client)
5. [Mounting NFS Share on Client](#5-mounting-nfs-share-on-client)
6. [Automounting NFS Share](#6-automounting-nfs-share)
7. [Conclusion](#7-conclusion)

## 1. Prerequisites

Before proceeding, ensure the following:

- **Server and Client Machines:**
  - You have two machines: one to act as the NFS server and the other as the client.
  - Both machines are connected to the same network.

- **User Privileges:**
  - You have administrative access to both the server and client machines.

## 2. Setting Up NFS Server

### On the Server Machine

1. **Install NFS Server:**

   ```bash
   sudo apt update
   sudo apt install nfs-kernel-server
   ```

2. **Create a Directory to Share:**

   ```bash
   sudo mkdir /shared_directory
   ```

3. **Set Permissions:**

   ```bash
   sudo chown nobody:nogroup /shared_directory
   sudo chmod 777 /shared_directory
   ```

## 3. Configuring NFS Server

1. **Edit Exports File:**

   Open `/etc/exports` using a text editor:

   ```bash
   sudo nano /etc/exports
   ```

   Add the following line to allow access to the shared directory:

   ```plaintext
   /shared_directory  client_ip(rw,sync,no_subtree_check)
   ```

   Replace `client_ip` with the IP address of your client machine.

2. **Restart NFS Server:**

   ```bash
   sudo systemctl restart nfs-kernel-server
   ```

## 4. Setting Up NFS Client

### On the Client Machine

1. **Install NFS Client:**

   ```bash
   sudo apt update
   sudo apt install nfs-common
   ```

## 5. Mounting NFS Share on Client

1. **Create a Local Mount Point:**

   ```bash
   sudo mkdir /mnt/nfs_share
   ```

2. **Mount NFS Share:**

   ```bash
   sudo mount server_ip:/shared_directory /mnt/nfs_share
   ```

   Replace `server_ip` with the IP address of your NFS server.

## 6. Automounting NFS Share

1. **Install autofs:**

   ```bash
   sudo apt install autofs
   ```

2. **Configure Autofs:**

   Open `/etc/auto.master`:

   ```bash
   sudo nano /etc/auto.master
   ```

   Add the following line at the end:

   ```plaintext
   /mnt /etc/auto.nfs_share
   ```

   Create `/etc/auto.nfs_share`:

   ```bash
   sudo nano /etc/auto.nfs_share
   ```

   Add:

   ```plaintext
   nfs_share  -fstype=nfs,rw,sync,no_subtree_check server_ip:/shared_directory
   ```

   Restart autofs:

   ```bash
   sudo systemctl restart autofs
   ```

## 7. Conclusion

You have successfully set up an NFS server and client, allowing seamless file sharing between machines. Adjust configurations based on your specific requirements.

*Note: This documentation was authored by Stanley Chinedu Ogada. If you have any questions or encounter issues, feel free to reach out for personalized assistance.*
