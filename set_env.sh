#!/bin/sh

echo DOCKER_GROUP_ID=`awk -F":" '$1 == "docker" {print $3}' /etc/group` > .env
