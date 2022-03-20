#!/bin/bash

#first move the contents of the old backup out and clear the directory
echo "Moving old influxdb backups if they exist"
[ -d ./backups/influxdb/db_old ] || sudo mkdir ./backups/influxdb/db_old
sudo rm ./backups/influxdb/db_old/* >/dev/null 2>&1
sudo mv ./backups/influxdb/db/* ./backups/influxdb/db_old/ >/dev/null 2>&1

CONTAINER_ID=`docker ps | grep 'influx' | awk '{ print $1 }'`

#execute the backup command
echo "Backing up influxdb database"
docker exec $CONTAINER_ID influxd backup /var/lib/influxdb/backup >/dev/null 2>&1
echo "Influxdb backup complete"
