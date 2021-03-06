#!/bin/bash

set -ex

# get image tag first
DATE=$(date +"%Y-%m-%d-%H-%M-%S")

# if ${IMAGE} parameter is not set - use copied artifacts
if [ -z "${IMAGE}" ]
then
  source publish_env.sh
else
  IMAGES="${IMAGE}"
fi

# iterate through all the images
for IMAGE in ${IMAGES}
do
  for URL in ${REGISTRY_URLS}
  do
    docker tag -f "${IMAGE}" "${URL}/${IMAGE}"
    docker push "${URL}/${IMAGE}"
    # upload additional date tagged image
    if [[ "${DATE_TAG}" == 'true' ]]; then
      docker tag -f "${IMAGE}" "${URL}/${IMAGE}-${DATE}"
      docker push "${URL}/${IMAGE}-${DATE}"
      docker rmi "${URL}/${IMAGE}-${DATE}"
    fi
    docker rmi "${URL}/${IMAGE}"
  done
done
