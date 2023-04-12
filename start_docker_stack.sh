#!/bin/sh
cd keys
bash generate_keys.sh
cd ..
docker-compose up -d
sleep 5
bash copy_known_hosts_docker.sh