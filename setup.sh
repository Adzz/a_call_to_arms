#! /bin/bash

docker-compose up -d --build &&
docker exec -it 32_bit_arm bash
