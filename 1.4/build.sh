#!/bin/bash
set -e
set -u
set -o pipefail

docker build --no-cache=true -t stefanofontanelli/elasticsearch .
docker push stefanofontanelli/elasticsearch:latest
docker tag -f stefanofontanelli/elasticsearch:latest stefanofontanelli/elasticsearch:1.4.4
docker push stefanofontanelli/elasticsearch:1.4.4
