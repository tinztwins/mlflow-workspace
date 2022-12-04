#!/bin/sh
# Troubleshooting: This script copies the hostkeys from docker container mlflow to docker container jupyter, 
# because of problems with the installation of openssh in the jupyter container. 
# Based on https://github.com/artificially-ai/ai-engineering/blob/master/scripts/copy_know_hosts.sh

docker cp mlflow:/root/.ssh/known_hosts .
docker cp known_hosts jupyter:/home/jovyan/.ssh/known_hosts
rm known_hosts
