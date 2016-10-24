#!/bin/bash

set +e
docker stop rag-dashboard
docker rm rag-dashboard
set -e

pushd rag-dashboard
docker build --tag rag-dashboard:latest .
popd

docker run -td --name rag-dashboard -p 3080:3080 -v app:/app rag-dashboard:latest
docker ps -a
