#!/bin/bash

set -x

cd /home/ubuntu/db_backup/

# remove the backup files older than 2 days
find ./ -name "*.gz" -type f -mtime +2 -exec git rm {} \;

# dump the data backup file to current directory
docker exec postgres_host pg_dump -U postgres -F t stage_db | gzip > $PWD/dump_`date +%d-%m-%Y"_"%H_%M_%S`.tar.gz

git add . && git commit -m "dump data of `date`" 
git status && git push origin master
