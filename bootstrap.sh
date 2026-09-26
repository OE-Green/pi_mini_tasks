#!/usr/bin/env bash

set -euo pipefail

REPO_URL="https://github.com/OE-Green/pi_mini_tasks.git"
REPO_DIR="$HOME/pi_mini_tasks"

echo "================================"
echo " Raspberry Pi Bootstrap"
echo "================================"

echo
echo "[1/3] Updating package lists..."
sudo apt update

echo
echo "[2/3] Installing Git..."
sudo apt install -y git

echo
echo "[3/3] Cloning repository..."

if [ -d "$REPO_DIR/.git" ]; then
    echo "Repository already exists at $REPO_DIR"
else
    git clone "$REPO_URL" "$REPO_DIR"
fi

echo
echo "Running setup..."
cd "$REPO_DIR"

bash ./setup.sh