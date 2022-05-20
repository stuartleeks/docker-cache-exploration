#!/bin/bash
set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


figlet "clean"
"$script_dir/../_clean-local.sh"
"$script_dir/../_clean-registry.sh"

TEMP_IMAGE_NAME="$IMAGE_NAME-temp"
figlet "build + push"
# build temp image
echo "== build temp"
docker buildx build --cache-to=type=inline --output=type=docker -t $TEMP_IMAGE_NAME -f "$script_dir/../../test-image/Dockerfile-multistage" "$script_dir/../../test-image"
# push
echo "== tag"
docker tag $TEMP_IMAGE_NAME $IMAGE_NAME
echo "== push"
docker push $IMAGE_NAME

figlet "clean 2"
"$script_dir/../_clean-local.sh"

figlet "build 2"
echo "** Look to see whether this uses caching -->"
docker buildx build --cache-from $IMAGE_NAME -t $IMAGE_NAME -f "$script_dir/../../test-image/Dockerfile-multistage" "$script_dir/../../test-image"


# links
# https://docs.master.dockerproject.org/engine/reference/commandline/buildx_build/#cache-to