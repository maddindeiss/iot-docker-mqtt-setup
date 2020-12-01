#!/bin/bash

echo "Create folders for OpenHab and fix permissions"

[ -d ./volumes/openhab ] || mkdir -p ./volumes/openhab
[ -d ./volumes/openhab/addons ] || mkdir -p ./volumes/openhab/addons
[ -d ./volumes/openhab/conf ] || mkdir -p ./volumes/openhab/conf
[ -d ./volumes/openhab/userdata ] || mkdir -p ./volumes/openhab/userdata
