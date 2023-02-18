# Usage
docker run -e POSTGRES_PASSWORD=password -e POSTGRES_MULTI_DB="db_1,db_2,db_3" kristofeekhaut/postgres-multi-db

# Build
docker buildx build --push --platform linux/arm/v7,linux/arm64/v8,linux/amd64 --tag kristofeekhaut/postgres-multi-db .