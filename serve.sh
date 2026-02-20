#!/bin/bash

source .env_common
source .env_server

#uv run mlflow server --allowed-hosts "*" --host 0.0.0.0
uv run mlflow server --allowed-hosts "*" --host 0.0.0.0 --default-artifact-root s3://mlflowbucket # the direct to s3 multipart upload
