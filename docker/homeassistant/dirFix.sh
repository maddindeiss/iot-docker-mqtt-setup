#!/bin/bash

echo "Create folders for HomeAssistant "

[ -d ./volumes/homeassistant ] || mkdir -p ./volumes/homeassistant
[ -d ./volumes/homeassistant/config ] || mkdir -p ./volumes/homeassistant/config
