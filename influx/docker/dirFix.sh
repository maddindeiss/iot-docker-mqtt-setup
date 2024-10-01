#!/bin/bash

echo "Create folders for InfluxDB "

[ -d ./volume ] || mkdir -p ./volume
[ -d ./volume/data ] || mkdir -p ./volume/data
[ -d ./backup ] || mkdir -p ./backup
[ -d ./backup/db ] || mkdir -p ./backup/db
