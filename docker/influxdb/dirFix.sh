#!/bin/bash

echo "Create folders for InfluxDB "

[ -d ./volumes/influxdb ] || sudo mkdir -p ./volumes/influxdb
[ -d ./volumes/influxdb/data ] || sudo mkdir -p ./volumes/influxdb/data
[ -d ./backups/influxdb ] || sudo mkdir -p ./backups/influxdb
[ -d ./backups/influxdb/db ] || sudo mkdir -p ./backups/influxdb/db
