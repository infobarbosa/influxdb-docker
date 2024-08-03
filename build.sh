#!/bin/bash
export BUILD_TAG=$(date +%Y%m%d)
docker compose down
docker rm influxproducer
docker rmi infobarbosa/influxproducer
docker build --no-cache --progress=plain -t infobarbosa/influxproducer:$BUILD_TAG . &> build.log

docker image tag infobarbosa/influxproducer:$BUILD_TAG infobarbosa/influxproducer:latest
docker image tag infobarbosa/influxproducer:$BUILD_TAG infobarbosa/influxproducer:$BUILD_TAG
