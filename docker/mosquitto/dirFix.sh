#!/bin/bash

echo "Create folders for Mosquitto and fix permissions"

[ -d ./volumes/mosquitto ] || mkdir -p ./volumes/mosquitto
[ -d ./volumes/mosquitto/data ] || mkdir -p ./volumes/mosquitto/data
[ -d ./volumes/mosquitto/log ] || mkdir -p ./volumes/mosquitto/log

sudo chown -R 1883:1883 ./volumes/mosquitto/
