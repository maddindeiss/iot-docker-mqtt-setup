#!/bin/bash

echo "Starting Teslamate to Grafana copy process"

# Get the directory where the script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Get the main component directory (teslamate)
COMPONENT_DIR="$(dirname "$SCRIPT_DIR")"

# Define the Grafana volume directory path
GRAFANA_VOLUME_DIR="$COMPONENT_DIR/../grafana/volume"
TESLAMATE_TMP_DIR="$COMPONENT_DIR/docker/teslamate_tmp"

# Load environment variables from .env file
[ ! -f "$COMPONENT_DIR/docker/postgres.env" ] || export $(grep -v '^#' "$COMPONENT_DIR/docker/postgres.env" | xargs)

# Update datasource.yml with variables from postgres.env
cp $COMPONENT_DIR/docker/grafana/datasource.yml.dist $COMPONENT_DIR/docker/grafana/datasource.yml
sed -i -e "s/_PASSWORD_/$POSTGRES_PASSWORD/g" $COMPONENT_DIR/docker/grafana/datasource.yml
sed -i -e "s/_USER_/$POSTGRES_USER/g" $COMPONENT_DIR/docker/grafana/datasource.yml

# Check if Grafana volume directory exists
if [ -d "$GRAFANA_VOLUME_DIR" ]; then
    echo "Grafana volume folder found."

    # Clone Teslamate to a temporary directory
    echo "Cloning Teslamate v1.31.1 into a temporary directory..."
    git clone --branch v1.31.1 --depth 1 https://github.com/teslamate-org/teslamate "$TESLAMATE_TMP_DIR"
    echo "Teslamate repository cloned successfully."

    # Ensure destination folders exist in Grafana volume
    mkdir -p "$GRAFANA_VOLUME_DIR/data/dashboards/teslamate"

    # DATASOURCE_FILE="$TESLAMATE_TMP_DIR/grafana/datasource.yml"
    DATASOURCE_FILE="$COMPONENT_DIR/docker/grafana/datasource.yml"
    DATASOURCE_TARGET_PATH="$GRAFANA_VOLUME_DIR/data/provisioning/datasources/"

    # DASHBOARDS_FILE="$TESLAMATE_TMP_DIR/grafana/dashboards.yml"
    DASHBOARDS_FILE="$COMPONENT_DIR/docker/grafana/dashboards.yml"
    DASHBOARDS_TARGET_PATH="$GRAFANA_VOLUME_DIR/data/provisioning/dashboards/"


    # Copy files from Teslamate's Grafana folder to Grafana volume directories
    echo "Copying files from Teslamate to Grafana volume directories..."

    echo "Try copying datasource file to: $DATASOURCE_TARGET_PATH"
    if [ ! -f "$DATASOURCE_TARGET_PATH/datasource.yml" ]; then
        cp $DATASOURCE_FILE $DATASOURCE_TARGET_PATH
        echo "Datasource file copied"
    else
        echo "Datasource file already exists. You need to update that file manually."
    fi

    echo "Try copying dashboard file to: $DASHBOARDS_TARGET_PATH"
    if [ ! -f "$DASHBOARDS_TARGET_PATH/dashboards.yml" ]; then
        cp $DASHBOARDS_FILE $DASHBOARDS_TARGET_PATH
        echo "Dashboard file copied"
    else
        echo "Dashboard file already exists. You need to update that file manually."
    fi
    
    # Copy JSON files
    cp "$TESLAMATE_TMP_DIR/grafana/dashboards/internal/"*.json "$GRAFANA_VOLUME_DIR/data/dashboards/teslamate"
    # cp "$TESLAMATE_TMP_DIR/grafana/dashboards/reports/"*.json "$GRAFANA_VOLUME_DIR/data/dashboards/dashboards_reports/"
    cp "$TESLAMATE_TMP_DIR/grafana/dashboards/"*.json "$GRAFANA_VOLUME_DIR/data/dashboards/teslamate"

    echo "Files copied successfully."

    # Clean up the temporary directory
    rm -rf "$TESLAMATE_TMP_DIR"
    rm $COMPONENT_DIR/docker/grafana/datasource.yml
    echo "Temporary directory and files are removed."
else
    echo "Grafana volume folder does not exist. Skipping git clone and file copy."
fi

echo "File copy to Grafana completed."
