#!/bin/bash
VM=hris
STORAGE_PATH=/Volumes/workspace/.docker/hris
alias docker-machine='docker-machine -s "/Volumes/workspace/.docker/hris"'
alias docker-env='eval "$(docker-machine env ${VM})"'
docker-env
