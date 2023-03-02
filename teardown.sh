#! /bin/bash

docker stop assemble &&
docker rm assemble &&
docker rmi assembly
