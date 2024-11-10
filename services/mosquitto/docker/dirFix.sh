#!/bin/bash

echo "Create folders for Mosquitto and fix permissions"

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the directory where the component is located
COMPONENT_DIR="$(dirname "$SCRIPT_DIR")"

[ -d "$COMPONENT_DIR/volume" ] || mkdir -p "$COMPONENT_DIR/volume"
[ -d "$COMPONENT_DIR/volume/data" ] || mkdir -p "$COMPONENT_DIR/volume/data"
[ -d "$COMPONENT_DIR/volume/log" ] || mkdir -p "$COMPONENT_DIR/volume/log"

sudo chown -R 1883:1883 "$COMPONENT_DIR/volume/"
