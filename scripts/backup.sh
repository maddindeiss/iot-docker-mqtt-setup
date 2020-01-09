#!/bin/bash

[ -d ./backups ] || mkdir ./backups

#create the list of files to backup
echo "./docker-compose.yml" >list.txt
echo "./docker/" >>list.txt
echo "./volumes/" >>list.txt

#if influxdb is running
if [ $(docker ps | grep -c influxdb) -gt 0 ]; then
	./scripts/backup_influxdb.sh
	echo "./backups/influxdb/" >>list.txt
fi

#setup variables
logfile=./backups/log_local.txt
backupfile="backup-$(date +"%Y-%m-%d_%H%M").tar.gz"

#compress the backups folders to archive
echo "compressing stack folders"
sudo tar -czf \
	./backups/$backupfile \
	--exclude=./volumes/influxdb/* \
	--exclude=./volumes/nextcloud/* \
	-T list.txt

rm list.txt

#set permission for backup files
sudo chown pi:pi ./backups/backup*

#create local logfile and append the latest backup file to it
echo "backup saved to ./backups/$backupfile"
sudo touch $logfile
sudo chown pi:pi $logfile
echo $backupfile >>$logfile

#show size of archive file
du -h ./backups/$backupfile

#remove older local backup files
#to change backups retained,  change below +8 to whatever you want (days retained +1)
ls -t1 ./backups/backup* | tail -n +8 | sudo xargs rm -f
echo "last seven local backup files are saved in ~/IOTstack/backups"

#cloud related - OneDrive

echo "synching to OneDrive"
echo "latest 7 backup files are kept"
## rclone sync -P ./backups --include "/backup*"  gdrive:/IOTstackBU/
echo "synch with Google Drive complete"
