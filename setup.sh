#! /bin/bash

docker build -t assembly . &&
docker run -t -d --name assemble assembly &&
docker exec -it assemble bash
