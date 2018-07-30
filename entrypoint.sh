#!/bin/bash

DATAVOLUMES=$@

#Continer name on ObjStorage
BACKUP_CONTAINER=Backup
BACKUP_FILENAME=docker/docker_data`date +%Y%m%d`.tar.bz2

source /OpenStackAuth.sh
source /opt/rh/rh-php70/enable

tar cfpj - $DATAVOLUMES --warning=no-file-changed |swift upload --object-name $BACKUP_FILENAME -S 5368709119 $BACKUP_CONTAINER -

# set Auto delete
swift post -H "X-Delete-After: $(php /hanoi-tower-backup.php)" $BACKUP_CONTAINER $BACKUP_FILENAME
