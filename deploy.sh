#!/usr/bin/env bash

set -e

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $# -ne 1 ]]; then
  echo "You must set a vuilder version number(same as vue-cli version)"
  echo "./deploy.sh <vuilder version>"
  exit 1
fi

version=$1

echo "Building docker image for vuilder ${version}..."
docker build -f "${base}/Dockerfile" -t nolabo/vuilder:${version} --build-arg version=${version} .
docker tag nolabo/vuilder:${version} nolabo/vuilder:latest

echo "Uploading docker image for vuilder ${version}..."
docker push nolabo/vuilder:${version}
docker push nolabo/vuilder:latest