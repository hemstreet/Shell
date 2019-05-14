#!/bin/bash

if [[ -z "$1" ]]
then
    echo "variable passed is either the name of the container, or the image name. ex:"
    echo "inspect.sh emacs-jon"
    exit 1
fi

DOCKER_CONTAINER_ID=$(docker inspect --format="{{.Id}}" $1)

if [[ -z "$DOCKER_CONTAINER_ID" ]]
then
      echo "Container not found by id ${DOCKER_CONTAINER_ID}"
      echo run \"docker container ps\" to see a list of running docker containers.
      echo Accepted values are \"NAMES\" and \"Image\"
else
    docker attach ${DOCKER_CONTAINER_ID}
fi