#!/bin/bash -l

source /etc/profile.d/dask.sh
source /etc/profile.d/mlflow.sh
source /etc/profile.d/api.sh
source /etc/profile.d/ollama.sh
source /etc/profile.d/s3.sh

exec jupyterhub-singleuser
