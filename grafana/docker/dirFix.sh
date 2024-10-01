#!/bin/bash

echo "Create folders for Grafana and fix permissions"

[ -d ./volume ] || mkdir -p ./volume
[ -d ./volume/data ] || mkdir -p ./volume/data
[ -d ./volume/log ] || mkdir -p ./volume/log

sudo chown -R 472:472 ./volume/data/ 
sudo chown -R 472:472 ./volume/log/
