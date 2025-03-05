#!/bin/bash

cat > grafana.cnf <<EOF
[req]
distinguished_name=req_distinguished_name
x509_extensions=v3_req
prompt=no

[req_distinguished_name]
CN=grafana

[v3_req]
subjectAltName=@alt_names

[alt_names]
IP.1=127.0.0.1
IP.2=172.27.28.126
EOF

openssl genrsa -out grafana.key 2048
openssl req -new -key grafana.key -out grafana.csr -config grafana.cnf
openssl x509 -req -in grafana.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out grafana.crt -days 365 -extfile grafana.cnf -extensions v3_req
cat grafana.key grafana.crt > grafana.pem
openssl x509 -in grafana.crt -text -noout | grep "Subject Alternative Name"
