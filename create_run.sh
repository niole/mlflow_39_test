#!/bin/bash

n=$1

uv run mlflow experiments create -n exp$n
uv run mlflow runs create --experiment-name exp$n
