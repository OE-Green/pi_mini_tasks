#!/usr/bin/env bash

set -euo pipefail

echo "================================"
echo " Raspberry Pi Development Setup"
echo "================================"

echo
echo "[1/4] Updating system..."

sudo apt update
sudo apt upgrade -y

echo
echo "[2/4] Installing development tools..."

sudo apt install -y \
    git \
    python3 \
    python3-pip \
    python3-venv

echo
echo "[3/4] Checking Git configuration..."

if ! git config --global user.name >/dev/null; then
    read -rp "Enter your Git name: " GIT_NAME
    git config --global user.name "$GIT_NAME"
else
    echo "Git username already configured:"
    git config --global user.name
fi

if ! git config --global user.email >/dev/null; then
    read -rp "Enter your Git email: " GIT_EMAIL
    git config --global user.email "$GIT_EMAIL"
else
    echo "Git email already configured:"
    git config --global user.email
fi

echo
echo "[4/4] Verifying installation..."

echo
echo "Git:"
git --version

echo
echo "Python:"
python3 --version

echo
echo "Pip:"
python3 -m pip --version

echo
echo "================================"
echo " Setup complete!"
echo "================================"