#!/bin/bash

echo "Create folders for Mosquitto and fix permissions"

[ -d ./volume ] || mkdir -p ./volume
[ -d ./volume/data ] || mkdir -p ./volume/data
[ -d ./volume/log ] || mkdir -p ./volume/log

sudo chown -R 1883:1883 ./volume/
