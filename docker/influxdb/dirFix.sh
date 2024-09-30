#!/bin/bash

echo "Create folders for InfluxDB "

[ -d ./volumes/influxdb2 ] || mkdir -p ./volumes/influxdb2
[ -d ./volumes/influxdb2/data ] || mkdir -p ./volumes/influxdb2/data
[ -d ./backups/influxdb2 ] || mkdir -p ./backups/influxdb2
[ -d ./backups/influxdb2/db ] || mkdir -p ./backups/influxdb2/db
