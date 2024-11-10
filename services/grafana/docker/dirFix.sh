#!/bin/bash

echo "Create folders for Grafana and fix permissions"

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the directory where the component is located
COMPONENT_DIR="$(dirname "$SCRIPT_DIR")"

[ -d "$COMPONENT_DIR/volume" ] || mkdir -p "$COMPONENT_DIR/volume"
[ -d "$COMPONENT_DIR/volume/data" ] || mkdir -p "$COMPONENT_DIR/volume/data"
[ -d "$COMPONENT_DIR/volume/data/lib" ] || mkdir -p "$COMPONENT_DIR/volume/data/lib"
[ -d "$COMPONENT_DIR/volume/data/provisioning" ] || mkdir -p "$COMPONENT_DIR/volume/data/provisioning"
[ -d "$COMPONENT_DIR/volume/data/provisioning/dashboards" ] || mkdir -p "$COMPONENT_DIR/volume/data/provisioning/dashboards"
[ -d "$COMPONENT_DIR/volume/data/provisioning/datasources" ] || mkdir -p "$COMPONENT_DIR/volume/data/provisioning/datasources"
[ -d "$COMPONENT_DIR/volume/data/dashboards" ] || mkdir -p "$COMPONENT_DIR/volume/data/dashboards"
[ -d "$COMPONENT_DIR/volume/log" ] || mkdir -p "$COMPONENT_DIR/volume/log"

# Fix permissions
sudo chown -R 472:472 "$COMPONENT_DIR/volume/data/lib"
sudo chown -R 472:472 "$COMPONENT_DIR/volume/log/"
