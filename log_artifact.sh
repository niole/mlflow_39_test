#!/bin/bash

RUN_ID=$1

source .env_common

uv run mlflow artifacts log-artifact -l filename.img --run-id $RUN_ID
