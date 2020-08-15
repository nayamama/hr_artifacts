#!/bin/bash

find /var/lib/docker/db_backup/ -mtime +6 -type f -delete
