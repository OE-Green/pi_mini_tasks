#!/bin/bash

PROJECT=$1

git pull

cd "$PROJECT"

python3 -m venv .venv
source .venv/bin/activate

pip install -r requirements.txt

python3 main.py