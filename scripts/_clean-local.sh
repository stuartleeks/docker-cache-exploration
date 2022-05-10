#!/bin/bash
set -e

if [[ -n "$(docker images -a -q)" ]]; then
	docker rmi -f $(docker images -a -q)
fi

docker builder prune --all -f