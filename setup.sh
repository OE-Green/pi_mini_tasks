#!/bin/bash

set -e

echo "=============================="
echo " Raspberry Pi Setup"
echo "=============================="

echo "[1/6] Updating package lists..."
sudo apt update

echo "[2/6] Upgrading installed packages..."
sudo apt upgrade -y

echo "[3/6] Installing development tools..."
sudo apt install -y \
    git \
    python3 \
    python3-pip \
    python3-venv

echo "[4/6] Creating projects directory..."
mkdir -p ~/projects

echo "[5/6] Configuring Git..."

git config --global user.name "Your Name"
git config --global user.email "YOUR_EMAIL@example.com"

echo "[6/6] Setup complete!"

echo
echo "Installed:"
git --version
python3 --version
pip3 --version

echo
echo "Your Pi is ready for development."