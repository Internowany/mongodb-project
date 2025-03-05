#!/bin/bash
sleep 10
MONGO_PASSWORD=$(cat /run/secrets/mongo_admin_password)

mongosh --host mongo1:27017 -u admin -p "$MONGO_PASSWORD" --tls --tlsCAFile /etc/ssl/ca.crt --tlsCertificateKeyFile /etc/ssl/mongo.pem --tlsAllowInvalidHostnames <<EOF
  var cfg = {
    "_id": "rs0",
    "version": 1,
    "members": [
      {
        "_id": 0,
        "host": "mongo1:27017",
        "priority": 2
      },
      {
        "_id": 1,
        "host": "mongo2:27017",
        "priority": 0
      },
      {
        "_id": 2,
        "host": "mongo3:27017",
        "priority": 0
      }
    ]
  };
  rs.initiate(cfg);
EOF
