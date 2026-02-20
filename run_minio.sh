#!/bin/bash

docker kill minio
docker rm minio
docker run -d --name minio -p 9000:9000 -p 9001:9001 --tmpfs /data:rw,size=1280m -e MINIO_ROOT_USER=minioadmin -e MINIO_ROOT_PASSWORD=minioadmin minio/minio:latest server /data --console-address :9001

export AWS_ACCESS_KEY_ID=minioadmin
export AWS_SECRET_ACCESS_KEY=minioadmin
export MLFLOW_S3_ENDPOINT_URL=http://localhost:9000

mc alias set myminio $MLFLOW_S3_ENDPOINT_URL $AWS_ACCESS_KEY_ID $AWS_SECRET_ACCESS_KEY
#"mc alias set myminio http://localhost:9000 minioadmin minioadmin && mc mb --ignore-existing myminio/" + bucket,

mc mb myminio/mlflowbucket
# list files in bucket
# mc ls myminio/mlflowbucket




