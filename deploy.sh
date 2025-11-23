#!/bin/bash
set -e

DOCKER_USER="Mani944-desi"
IMAGE="$DOCKER_USER/prod:latest"

echo "Pulling $IMAGE"
docker pull "$IMAGE"

echo "Stopping existing container (if any)"
docker rm -f react-app || true

echo "Starting new container"
docker run -d --name react-app -p 80:80 --restart unless-stopped "$IMAGE"

echo "Deployed."
