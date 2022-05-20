#!/bin/bash
set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


figlet "clean"
"$script_dir/../_clean-local.sh"
"$script_dir/../_clean-registry.sh"

figlet "build + push"
(cd "$script_dir/../../test-image" && docker-compose build)
docker tag test-image_test $IMAGE_NAME
docker push $IMAGE_NAME

figlet "manifest"
docker manifest inspect -v $IMAGE_NAME


figlet "clean 2"
"$script_dir/../_clean-local.sh"

figlet "build 2"
echo "** Look to see whether this uses caching -->"
(cd "$script_dir/../../test-image" && docker-compose build)

figlet "manifest 2"
docker manifest inspect -v $IMAGE_NAME
