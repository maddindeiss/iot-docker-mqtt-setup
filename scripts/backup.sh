#!/bin/bash

[ -d ./backups ] || mkdir ./backups

#setup variables
BASEBACKUPFILE="$(date +"%Y-%m-%d_%H%M")"
LOGFILE=./backups/log_$BASEBACKUPFILE.txt
BACKUPLIST=./backups/backuplist_$BASEBACKUPFILE.txt
BACKUPFILE="./backups/backup-$BASEBACKUPFILE.tar.gz"

touch $LOGFILE
echo "" >> $LOGFILE
echo "### Backup log ###" >> $LOGFILE
echo "Started At: $(date +"%Y-%m-%dT%H-%M-%S")" >> $LOGFILE
echo "Current Directory: $(pwd)" >> $LOGFILE


echo "" >> $BACKUPLIST

#create the list of files to backup
echo "./docker-compose.yml" >> $BACKUPLIST
echo "./services/" >> $BACKUPLIST

#if influxdb is running
if [ $(docker ps | grep -c influx) -gt 0 ]; then
	echo "Run InfluxDB backup script" >> $LOGFILE
	chmod +x ./scripts/backup_influxdb.sh
	./scripts/backup_influxdb.sh
	echo "./backups/influxdb/" >> $BACKUPLIST
	echo "InfluxDB backup script done" >> $LOGFILE
fi

#compress the backups folders to archive
echo "Pack/compress backup folders" >> $LOGFILE
sudo tar -czf $BACKUPFILE -T $BACKUPLIST >> $LOGFILE 2>&1
	#--exclude=./volumes/influxdb/* \

#set permission for backup files
sudo chown pi:pi ./backups/backup* >> $LOGFILE 2>&1

#append the latest backup file to logfile
echo "Backup saved to $BACKUPFILE" >> $LOGFILE
sudo chown pi:pi $LOGFILE

#show size of archive file
echo "Backupsize" >> $LOGFILE
du -h $BACKUPFILE >> $LOGFILE 2>&1

echo "" >> $LOGFILE

#remove older local backup files
#to change backups retained,  change below +8 to whatever you want (days retained +1)
ls -t1 ./backups/backup* | tail -n +8 | sudo xargs rm -f
echo "Last seven local backup files are saved in ./backups" >> $LOGFILE

echo "Finished At: $(date +"%Y-%m-%dT%H-%M-%S")" >> $LOGFILE
echo "" >> $LOGFILE

echo "Items backed up:" >> $LOGFILE
cat $BACKUPLIST >> $LOGFILE 2>&1
echo "" >> $LOGFILE
rm -rf $BACKUPLIST

#cloud related - OneDrive

echo "Copy backups to OneDrive" >> $LOGFILE
echo "All backups younger than 24h are copied to Onedrive" >> $LOGFILE
rclone copy --max-age 24h -P ./backups --include "/backup*" Onedrive:Backups/IOT_Raspberry_Backup >> $LOGFILE 2>&1
echo exit code = $?

if [[ $? -gt 0 ]];
then
	echo "Copying to OneDrive complete!" >> $LOGFILE
else 
	echo "Copying to OneDrive failed!" >> $LOGFILE
fi

echo "" >> $LOGFILE
echo "### End of log ###" >> $LOGFILE
echo "" >> $LOGFILE

cat $LOGFILE
