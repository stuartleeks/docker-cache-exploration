#!/bin/bash
set -e

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


figlet "clean"
"$script_dir/_clean-local.sh"
"$script_dir/_clean-registry.sh"

TEMP_IMAGE_NAME="$IMAGE_NAME-temp"
FEATURE_IMAGE_NAME="$IMAGE_NAME-features"
figlet "build + push"
# build temp image
echo "== build temp"
docker buildx build --cache-to=type=inline,mode=max --output=type=docker -t $TEMP_IMAGE_NAME -f "$script_dir/../test-image/Dockerfile" "$script_dir/../test-image"
# build features image
echo "== build features"
docker buildx build --cache-to=type=inline,mode=max --output=type=docker -t $FEATURE_IMAGE_NAME -f "$script_dir/../test-image/Dockerfile-features" "$script_dir/../test-image"
# tag and push
echo "== tag"
docker tag $FEATURE_IMAGE_NAME $IMAGE_NAME
echo "== push"
docker push $IMAGE_NAME

figlet "clean 2"
"$script_dir/_clean-local.sh"

figlet "build 2"
echo "** Look to see whether this uses caching -->"
docker buildx build --cache-from $IMAGE_NAME -t $IMAGE_NAME -f "$script_dir/../test-image/Dockerfile" "$script_dir/../test-image"


# links
# https://docs.master.dockerproject.org/engine/reference/commandline/buildx_build/#cache-to