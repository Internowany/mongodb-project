MongoDB Project


Secure, high-availability MongoDB cluster with logging, custom metrics, and a complete monitoring system using Docker Compose, Prometheus, Loki, and Grafana.

Installation and setup:

1. Prerequisites:

- Install Docker and Docker Compose on your host system.

- Generate or obtain TLS certificates for MongoDB and reverse proxy (NOTE: for ease of testing, predefined certificates were added to the repository; for production environment it is advised to generate new certificates).

- Generate admin password in the secret/env files (NOTE: for ease of testing, predefined passwords were added to the repository; for production environment it is advised to generate new passwords).


2. Clone the Repository:

    git clone https://github.com/Internowany/mongodb-project.git


3. Review and Update Configurations (optional):

- Update secrets, env files and mongo-keyfile, replacing placeholders with your environment-specific values (passwords, certificates).

- Adjust other configuration files as needed.


4. Start the Services:

- Execute starting script in the terminal (the script also adjusts files ownership and permissions (NOTE: mongo-keyfile MUST have set chown 400 (only read by a user) and chmod 999:999 (the owner of the file must be user docker)))

  ./start.sh


5. Verification:

    You can use below command to verify the connectivity to the MongoDB cluster:

    mongosh --host 127.0.0.1:27017 -u admin -p password --tls --tlsCAFile ./tls/ca.crt --tlsCertificateKeyFile ./tls/mongo.pem

6. Accessing the dashboards:

    Grafana can be accessed via NGINX reverse proxy with HTTPS at https://localhost. Login using the default or configured credentials and import the provided dashboards:
