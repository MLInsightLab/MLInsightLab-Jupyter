# MLInsightLab-Jupyter

This repository contains the source code for the **ML Insight Lab Jupyter Service**, which manages the JupyterHub environment for interactive development within the ML Insight Lab Platform.

## Overview

The **Jupyter Service** provides a collaborative, browser-based environment for users to interactively develop, experiment, and analyze machine learning workflows. It integrates tightly with other core components of the platform, enabling seamless development and orchestration.

Key features include:

- **JupyterHub orchestration** for managing multiple user sessions
- **Integration with the Dask service** to offload and parallelize compute workloads
- **Connectivity with MLflow** for tracking experiments and model metrics
- **Access to the APIHub** for secure authentication and user/session management

Together, these integrations allow data scientists and ML engineers to prototype, scale, and monitor their workflows from a single interface.

## Build Status

[![Jupyter Service CI](https://github.com/mlinsightlab/mlinsightlab-jupyter/actions/workflows/docker-publish.yml/badge.svg)](https://github.com/mlinsightlab/mlinsightlab-jupyter/actions/workflows/docker-publish.yml)

This service is automatically built and published via GitHub Actions. You do **not** need to clone or build this repository unless you are contributing to the JupyterHub setup or extending its integrations.

## When to Use This Repository

You should pull and work on this repository **only** when:

- You are customizing the JupyterHub environment (e.g., extensions, spawners, or UI configuration)
- You are modifying how the service interacts with Dask, MLflow, or APIHub
- You are debugging issues related to user sessions or environment setup

For day-to-day use, the Jupyter service is deployed automatically as part of the platform and requires no manual setup.

---

Contributions, suggestions, and improvements are always welcome via issues or pull requests.
