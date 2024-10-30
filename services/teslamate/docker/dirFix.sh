#!/bin/bash

echo "Create folders for Teslamate"

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the directory where the component is located
COMPONENT_DIR="$(dirname "$SCRIPT_DIR")"

[ -d "$COMPONENT_DIR/volume" ] || mkdir -p "$COMPONENT_DIR/volume"
[ -d "$COMPONENT_DIR/volume/import" ] || mkdir -p "$COMPONENT_DIR/volume/import"
[ -d "$COMPONENT_DIR/volume/postgres" ] || mkdir -p "$COMPONENT_DIR/volume/postgres"
[ -d "$COMPONENT_DIR/volume/postgres/data" ] || mkdir -p "$COMPONENT_DIR/volume/postgres/data"

sudo chown -R 999 "$COMPONENT_DIR/volume/postgres/data"
