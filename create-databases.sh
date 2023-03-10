#!/bin/bash

set -e
set -u

function createDatabase() {
  local database=$1
  echo "Creating database '$database'"
  psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER $database;
    CREATE DATABASE $database;
    GRANT ALL PRIVILEGES ON DATABASE $database TO $database;
EOSQL
}

if [ -n "$POSTGRES_MULTI_DB" ]; then
  echo "Create multiple databases: $POSTGRES_MULTI_DB"
  for db in $(echo $POSTGRES_MULTI_DB | tr ',' ' '); do
    createDatabase $db
  done
  echo "Databases created"
fi