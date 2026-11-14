#!/bin/bash

# --- CUDA Installation Script ---

# 1. Download the NVIDIA keyring package
echo "Downloading CUDA keyring package..."
wget https://developer.download.nvidia.com/compute/cuda/repos/debian13/x86_64/cuda-keyring_1.1-1_all.deb

# 2. Install the keyring package
echo "Installing CUDA keyring package..."
dpkg -i cuda-keyring_1.1-1_all.deb

# 3. Update apt repositories and install CUDA Toolkit 13.2
echo "Updating repositories and installing CUDA Toolkit 13.2..."
apt update && apt -y install cuda-toolkit-13-2

# 4. Backup the original .bashrc file
echo ".bashrc backup created."
cp .bashrc .bashrc-backup

# 5. Append the necessary PATH export to .bashrc
# This is a programmatic way to append the line, which is safer than relying on 'nano'
echo "export PATH=/usr/local/cuda-13.2/bin:\$PATH" >> .bashrc

echo "--------------------------------------------------"
echo "✅ CUDA Installation and Configuration Complete!"
echo "--------------------------------------------------"
echo "source ~/.bashrc"
source ~/.bashrc
nvcc --version