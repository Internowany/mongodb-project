#!/bin/bash
openssl req -new -x509 -days 365 -keyout ca.key -out ca.crt -subj "/CN=MongoDB-CA"
openssl genrsa -out mongo.key 2048
openssl req -new -key mongo.key -out mongo.csr -subj "/CN=mongo1"
openssl x509 -req -in mongo.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out mongo.crt -days 365
cat mongo.key mongo.crt > mongo.pem


# generate with SAN
cat > mongo.cnf <<EOF
[req]
distinguished_name=req_distinguished_name
x509_extensions=v3_req
prompt=no

[req_distinguished_name]
CN=mongodb

[v3_req]
subjectAltName=@alt_names

[alt_names]
DNS.1=mongo1
DNS.2=mongo2
DNS.3=mongo3
IP.1=127.0.0.1
IP.2=172.27.28.126
EOF

openssl req -new -x509 -days 365 -keyout ca.key -out ca.crt -subj "/CN=MongoDB-CA"
openssl genrsa -out mongo.key 2048
openssl req -new -key mongo.key -out mongo.csr -config mongo.cnf
openssl x509 -req -in mongo.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out mongo.crt -days 365 -extfile mongo.cnf -extensions v3_req
cat mongo.key mongo.crt > mongo.pem
openssl x509 -in mongo.crt -text -noout | grep "Subject Alternative Name"
