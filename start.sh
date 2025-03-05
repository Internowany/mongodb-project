#!/bin/bash
sudo chown -R $USER:$USER ../mongodb-project/
sudo chmod -R 755 ../mongodb-project/
sudo chown 999:999 ./mongodb/mongo-keyfile
sudo chmod 400 ./mongodb/mongo-keyfile
sleep 3
docker compose up -d
