#!/bin/bash

echo "Create folders for Grafana and fix permissions"

[ -d ./volumes/grafana ] || sudo mkdir -p ./volumes/grafana
[ -d ./volumes/grafana/data ] || sudo mkdir -p ./volumes/grafana/data
[ -d ./volumes/grafana/log ] || sudo mkdir -p ./volumes/grafana/log

sudo chown -R 472:472 ./volumesgrafana/data/ 
sudo chown -R 472:472 ./volumesgrafana/log/ 