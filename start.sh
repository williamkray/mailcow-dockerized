#!/usr/bin/env bash

pushd ./data/Dockerfiles/nginx/
  docker build -t nginx-mailcow:sslwatch .
popd

docker-compose up -d
