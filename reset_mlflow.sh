#!/bin/bash

uv remove mlflow
uv add ../mlflow
docker kill minio
docker rm minio
source ../train-mlflow-docker/run_minio.sh
