#!/bin/bash

set -x

docker exec postgres_host pg_dump -U postgres -F t stage_db | gzip > /var/lib/docker/db_backup/dump_`date +%d-%m-%Y"_"%H_%M_%S`.tar.gz

cd /var/lib/docker/db_backup/
git add . && git commit -m "dump data of `date`" 
git status && git push origin master
