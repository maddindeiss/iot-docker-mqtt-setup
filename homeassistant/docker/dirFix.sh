#!/bin/bash

echo "Create folders for HomeAssistant "

[ -d ./volume ] || mkdir -p ./volume
[ -d ./volume/config ] || mkdir -p ./volume/config

# Run Home Assistant as non-root using the official docker image
git clone --branch v2.3 https://github.com/tribut/homeassistant-docker-venv ./volume/docker
