#!/bin/bash -ex

if [ "${TRAVIS_BRANCH}" == "master" ]; then
  TAG="latest"
elif [ ! -z "${TRAVIS_TAG}" ] && [ "${TRAVIS_PULL_REQUEST}" == "false" ]; then
  TAG=${TRAVIS_TAG}
elif [ ! -z "${TRAVIS_BRANCH}" ] && [ "${TRAVIS_PULL_REQUEST}" == "false" ]; then
  TAG=${TRAVIS_BRANCH}
else
  echo "Don't know how to build image"
  exit 1
fi

echo "Building image with tag ${TAG}"

mkdir -p bin
docker run -it --rm -v $(pwd)/bin:/dist mvisonneau/wavefront-forwarder-builder:latest
docker build -t mvisonneau/wavefront-forwarder:${TAG} .
docker run -d --name wavefront-forwarder -e TOKEN="undef" mvisonneau/wavefront-forwarder:${TAG}
