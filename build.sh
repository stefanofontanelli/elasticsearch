#!/bin/bash
set -e
set -u
set -o pipefail

[ $# -ne 1 ] && echo "usage: ./build.sh <version>" && exit 1
VERSION="$1"
MAJOR=${VERSION%%??}  # clearly.
mkdir -p "$MAJOR"
sed -e 's/%%ELASTICSEARCH_VERSION%%/'"$VERSION"'/g' -e 's/%%ELASTICSEARCH_MAJOR%%/'"$MAJOR"'/g' Dockerfile.template > "$MAJOR"/Dockerfile

pushd "$MAJOR"
docker build --no-cache=true -t gild/elasticsearch:"$VERSION" .
docker push gild/elasticsearch:"$VERSION"
