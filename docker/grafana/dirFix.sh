#!/bin/bash

echo "Create folders for Grafana and fix permissions"

[ -d ./volumes/grafana ] || mkdir -p ./volumes/grafana
[ -d ./volumes/grafana/data ] || mkdir -p ./volumes/grafana/data
[ -d ./volumes/grafana/log ] || mkdir -p ./volumes/grafana/log

sudo chown -R 472:472 ./volumes/grafana/data/ 
sudo chown -R 472:472 ./volumes/grafana/log/
