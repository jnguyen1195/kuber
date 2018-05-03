#!/bin/bash
find / -name postgres -print
ls -ltr /var/lib/postgresql/*
bash /usr/local/bin/docker-entrypoint.sh
#sudo -u postgres /usr/lib/postgresql/9.4/bin/postgres -D /var/lib/postgresql/data
