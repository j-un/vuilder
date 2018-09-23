#!/usr/bin/env bash

set -e

base="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [[ $# -ne 1 ]]; then
    echo "You must set a version number"
    echo "./deploy.sh <vue-cli version>"
    exit 1
fi

version=$1

echo "Building docker images for vuilder ${version}..."
docker build -f "${base}/Dockerfile" -t nolabo/vuilder:${version} --build-arg version=${version} .
docker tag nolabo/vuilder:${version} nolabo/vuilder:latest

echo "Uploading docker images for vuilder ${version}..."
docker push nolabo/vuilder:${version}
docker push nolabo/vuilder:latest
