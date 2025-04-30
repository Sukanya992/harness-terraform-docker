#!/bin/bash

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
  echo "Docker not found, installing Docker..."
  # Update package list and install Docker
  apt-get update
  apt-get install -y docker.io
  # Add the current user to the Docker group to avoid sudo for docker commands
  usermod -aG docker $USER
  # Start Docker service
  systemctl start docker
  systemctl enable docker
  echo "Docker installed successfully."
else
  echo "Docker is already installed."
fi

# Now install the Harness Delegate using Docker
echo "Installing Harness Delegate..."
docker run  --cpus=1 --memory=2g \
  -e DELEGATE_NAME=docker-delegate \
  -e NEXT_GEN="true" \
  -e DELEGATE_TYPE="DOCKER" \
  -e ACCOUNT_ID=AOTqsni_TsSZSFPeNjom6A \
  -e DELEGATE_TOKEN=YjZlNTUyZmYyYmQxYTNjM2EwOTQ1YTk4ZjE5MjVjMTQ= \
  -e DELEGATE_TAGS="" \
  -e MANAGER_HOST_AND_PORT=https://app.harness.io us-docker.pkg.dev/gar-prod-setup/harness-public/harness/delegate:25.04.85701
echo "Harness Delegate installation complete."
