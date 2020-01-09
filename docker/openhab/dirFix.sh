#!/bin/bash

echo "Create folders for OpenHab and fix permissions"

[ -d ./volumes/openhab ] || sudo mkdir -p ./volumes/openhab
[ -d ./volumes/openhab/addons ] || sudo mkdir -p ./volumes/openhab/addons
[ -d ./volumes/openhab/conf ] || sudo mkdir -p ./volumes/openhab/conf
[ -d ./volumes/openhab/userdata ] || sudo mkdir -p ./volumes/openhab/userdata

sudo chown -R $USER:$USER ./volumes/openhab