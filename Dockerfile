############################
# Stage 1: Node (LTS)
############################
FROM node:lts-slim AS node

# Install Configurable HTTP Proxy globally
RUN npm install -g configurable-http-proxy

############################
# Stage 2: Python runtime
############################
FROM python:3.12-slim

# Install system packages
RUN apt update && apt upgrade -y && apt autoremove -y && \
    apt install -y \
        git emacs htop tmux sudo cron less zip unzip \
        ca-certificates curl gnupg build-essential && \
    rm -rf /var/lib/apt/lists/*

# Copy Node and npm from Node stage (fixes 'node: not found' for CHP)
COPY --from=node /usr/local/ /usr/local/

# Ensure npm global binaries are on PATH
ENV PATH="/usr/local/lib/node_modules/.bin:${PATH}"

# Copy Python requirements and install
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir --upgrade pip uv && \
    uv pip install --system --no-cache-dir --upgrade -r /tmp/requirements.txt

# Install ollama CLI
RUN curl -fsSL https://ollama.com/install.sh | sh

# Configure sudo to not require password
RUN echo "%sudo ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/root

# Create mlil group
RUN groupadd -g 1004 mlil

# Copy JupyterHub configuration
COPY jupyterhub_config.py /srv/jupyter/jupyterhub_config.py
COPY jupyterhub_theme /usr/local/share/jupyterhub
COPY jupyterhub-singleuser.sh /srv/jupyter/jupyterhub-singleuser.sh
RUN chmod +x /srv/jupyter/jupyterhub-singleuser.sh

# Copy start script
COPY start_jupyter.sh /code/start_jupyter.sh
RUN chmod +x /code/start_jupyter.sh

# Set working directory
WORKDIR /

# Verify Node and npm are installed
RUN node -v && npm -v
