#!/bin/bash
set -e

DOCKER_USER="Mani944-desi"
BRANCH="${BRANCH_NAME:-dev}"

if [ "$BRANCH" = "master" ]; then
  REPO="$DOCKER_USER/prod"
else
  REPO="$DOCKER_USER/dev"
fi

echo "Building $REPO:latest"
docker build -t "$REPO:latest" .

echo "Pushing $REPO:latest"
docker push "$REPO:latest"

echo "Done."
