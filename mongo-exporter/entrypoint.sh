#!/bin/bash
export MONGODB_URI="$(cat /run/secrets/mongo_admin_password)
exec "$@"
