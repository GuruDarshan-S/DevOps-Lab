#!/bin/bash
docker network create --driver bridge my-bridge-net
docker build -t flask-api .
docker run -d --name mysql --net=my-bridge-net -e MYSQL_ROOT_PASSWORD=secret mysql:latest
docker run -d --name redis --net=my-bridge-net redis:latest
docker run -d --name flask --net=my-bridge-net -p 5001:5001 flask-api

docker exec -it flask ping -c 3 mysql
docker exec -it flask ping -c 3 redis

docker stop mysql redis flask && docker rm mysql redis flask
docker network rm my-bridge-net
