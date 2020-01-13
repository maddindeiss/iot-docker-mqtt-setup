#!/bin/bash

#first move the contents of the old backup out and clear the directory
echo "Moving old influxdb backups if they exist"
[ -d ./backups/influxdb/db_old ] || sudo mkdir ./backups/influxdb/db_old
sudo rm ./backups/influxdb/db_old/* >/dev/null 2>&1
sudo mv ./backups/influxdb/db/* ./backups/influxdb/db_old/ >/dev/null 2>&1

CONTAINER_ID=`docker ps | grep 'influx' | awk '{ print $1 }'`

#execute the backup command
echo "backing up influxdb database"
docker exec $CONTAINER_ID influxd backup -portable /var/lib/influxdb/backup >/dev/null 2>&1
echo "influxdb backup complete"
