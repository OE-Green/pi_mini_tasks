#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <project>"
    echo
    echo "Example:"
    echo "  $0 01_blinking_led"
    exit 1
fi

PROJECT="$1"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_DIR="$SCRIPT_DIR/projects/$PROJECT"

echo "================================"
echo " Raspberry Pi Project Deployment"
echo "================================"

echo
echo "Project: $PROJECT"

cd "$SCRIPT_DIR"

echo
echo "[1/4] Pulling latest changes..."

git pull

if [ ! -d "$PROJECT_DIR" ]; then
    echo
    echo "Error: project '$PROJECT' does not exist."
    echo
    echo "Available projects:"
    find "$SCRIPT_DIR/projects" -mindepth 1 -maxdepth 1 -type d \
        -printf "  %f\n" 2>/dev/null || true
    exit 1
fi

cd "$PROJECT_DIR"

echo
echo "[2/4] Setting up Python environment..."

if [ ! -d ".venv" ]; then
    python3 -m venv .venv
    echo "Created virtual environment."
else
    echo "Virtual environment already exists."
fi

echo
echo "[3/4] Installing dependencies..."

if [ -f "requirements.txt" ]; then
    .venv/bin/python -m pip install -r requirements.txt
else
    echo "No requirements.txt found. Skipping dependency installation."
fi

echo
echo "[4/4] Running project..."

if [ ! -f "main.py" ]; then
    echo "Error: main.py not found in $PROJECT"
    exit 1
fi

.venv/bin/python main.py