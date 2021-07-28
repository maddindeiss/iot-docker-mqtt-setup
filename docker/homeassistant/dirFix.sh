#!/bin/bash

echo "Create folders for HomeAssistant "

[ -d ./volumes/homeassistant ] || mkdir -p ./volumes/homeassistant
[ -d ./volumes/homeassistant/config ] || mkdir -p ./volumes/homeassistant/config

# Run Home Assistant as non-root using the official docker image
git clone --branch v2.3 https://github.com/tribut/homeassistant-docker-venv ./volumes/homeassistant/docker
