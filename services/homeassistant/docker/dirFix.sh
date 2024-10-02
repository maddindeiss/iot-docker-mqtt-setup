#!/bin/bash

echo "Create folders for HomeAssistant "

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the directory where the component is located
COMPONENT_DIR="$(dirname "$SCRIPT_DIR")"

[ -d "$COMPONENT_DIR/volume" ] || mkdir -p "$COMPONENT_DIR/volume"
[ -d "$COMPONENT_DIR/volume/config" ] || mkdir -p "$COMPONENT_DIR/volume/config"
[ -d "$COMPONENT_DIR/volume/docker" ] || mkdir -p "$COMPONENT_DIR/volume/docker"

# Run Home Assistant as non-root using the official docker image
git clone --branch v2.3 https://github.com/tribut/homeassistant-docker-venv "$COMPONENT_DIR/volume/docker"
