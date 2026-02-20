This repo is for iterating on the configuration for
multipart file upload of mlflow artifacts (log-artifact) to s3 compatible storage

ATM it is configured to not proxy the multipart upload throught mlflow server,
because that leads to buffering of the upload request on the server before
uploading to s3, which is very slow bc the request is large.

The downside of this approach is that we move auth for s3 into the client. We current depend on access keys and ids for that,
maybe we would switch to using the AWS_SESSION_TOKEN env var.
See supported env vars in mlflow/store/artifact/s3_artifact_repo.py S3ArtifactRepository

dependencies:
- minio client (mc)
- git
- uv

run:

- clone train-mlflow-docker and checkout branch with patch changes
- clone mlflow repo, checkout 3.9 branch, apply the patch
- clone this repo, run ./reset_mlflow.sh
- run ./serve.sh
- in another terminal window, source .env_common
- call ./create_run.sh 1
- then call ./log_artifact.sh <runid>
