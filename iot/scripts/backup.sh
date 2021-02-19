#!/bin/bash

[ -d ./backups ] || mkdir ./backups

#create the list of files to backup
echo "./docker-compose.yml" >list.txt
echo "./docker/" >>list.txt
echo "./volumes/" >>list.txt

#if influxdb is running
if [ $(docker ps | grep -c influx) -gt 0 ]; then
	chmod +x ./scripts/backup_influxdb.sh
	./scripts/backup_influxdb.sh
	echo "./backups/influxdb/" >>list.txt
fi

#setup variables
logfile=./backups/log_local.txt
backupfile="backup-$(date +"%Y-%m-%d_%H%M").tar.gz"

#compress the backups folders to archive
echo "Compressing stack folders"
sudo tar -czf \
	./backups/$backupfile \
	--exclude=./volumes/influxdb/* \
	-T list.txt

rm list.txt

#set permission for backup files
sudo chown pi:pi ./backups/backup*

#create local logfile and append the latest backup file to it
echo "Backup saved to ./backups/$backupfile"
sudo touch $logfile
sudo chown pi:pi $logfile
echo $backupfile >>$logfile

#show size of archive file
du -h ./backups/$backupfile

#remove older local backup files
#to change backups retained,  change below +8 to whatever you want (days retained +1)
ls -t1 ./backups/backup* | tail -n +8 | sudo xargs rm -f
echo "Last seven local backup files are saved in ./backups"

#cloud related - OneDrive

echo "Copy backups to OneDrive"
echo "All backups younger than 24h are copied to Onedrive"
rclone copy --max-age 24h -P ./backups --include "/backup*" Onedrive:Backups/IOT_Raspberry_Backup

echo "Copying to OneDrive complete!"
