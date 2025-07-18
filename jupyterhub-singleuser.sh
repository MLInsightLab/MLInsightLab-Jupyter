#!/bin/bash -l

source /etc/profile.d/dask.sh
source /etc/profile.d/mlflow.sh
source /etc/profile.d/api.sh
source /etc/profile.d/ollama.sh

exec jupyterhub-singleuser
