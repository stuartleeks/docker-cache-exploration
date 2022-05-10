#!/bin/bash
set -e

if [[ -n "$(docker images -a -q)" ]]; then
	docker rmi -f $(docker images -a -q)
fi

package_get_status=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: Bearer $CR_PAT"  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/users/stuartleeks/packages/container/$IMAGE_BASE_NAME)
if [[ "$package_get_status" != "404" ]]; then
	curl -X DELETE -H "Authorization: Bearer $CR_PAT"  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/users/stuartleeks/packages/container/$IMAGE_BASE_NAME 
fi

FEATURE_IMAGE_BASE_NAME="${IMAGE_BASE_NAME}-features"
package_get_status=$(curl -s -o /dev/null -w "%{http_code}" -H "Authorization: Bearer $CR_PAT"  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/users/stuartleeks/packages/container/$FEATURE_IMAGE_BASE_NAME)
if [[ "$package_get_status" != "404" ]]; then
	curl -X DELETE -H "Authorization: Bearer $CR_PAT"  -H "Accept: application/vnd.github.v3+json"   https://api.github.com/users/stuartleeks/packages/container/$FEATURE_IMAGE_BASE_NAME 
fi

