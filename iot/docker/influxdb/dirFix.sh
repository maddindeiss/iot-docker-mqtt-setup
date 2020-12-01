#!/bin/bash

echo "Create folders for InfluxDB "

[ -d ./volumes/influxdb ] || mkdir -p ./volumes/influxdb
[ -d ./volumes/influxdb/data ] || mkdir -p ./volumes/influxdb/data
[ -d ./backups/influxdb ] || mkdir -p ./backups/influxdb
[ -d ./backups/influxdb/db ] || mkdir -p ./backups/influxdb/db
