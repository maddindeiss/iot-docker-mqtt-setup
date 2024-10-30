#!/bin/bash

echo "Create folders for Heimdall"

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the directory where the component is located
COMPONENT_DIR="$(dirname "$SCRIPT_DIR")"

[ -d "$COMPONENT_DIR/volume" ] || mkdir -p "$COMPONENT_DIR/volume"
[ -d "$COMPONENT_DIR/volume/config" ] || mkdir -p "$COMPONENT_DIR/volume/config"

sudo chown -R 1000:1000 "$COMPONENT_DIR/volume/config"
