#!/bin/bash

echo "Create folders for InfluxDB "

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the directory where the component is located
COMPONENT_DIR="$(dirname "$SCRIPT_DIR")"

[ -d "$COMPONENT_DIR/volume" ] || mkdir -p "$COMPONENT_DIR/volume"
[ -d "$COMPONENT_DIR/volume/data" ] || mkdir -p "$COMPONENT_DIR/volume/data"
[ -d "$COMPONENT_DIR/backup" ] || mkdir -p "$COMPONENT_DIR/backup"
[ -d "$COMPONENT_DIR/backup/db" ] || mkdir -p "$COMPONENT_DIR/backup/db"
