#!/bin/bash
set -e

IMAGE_NAME="cd-lab-app"
CONTAINER_NAME="lab-app"
VERSION=${1:-latest}

echo "🚀 Starting deployment of version $VERSION"

# Build new image
echo "Building Docker image..."
docker build -t $IMAGE_NAME:$VERSION .

# Stop and remove old container
echo "Stopping old container..."
docker stop $CONTAINER_NAME 2>/dev/null || true
docker rm $CONTAINER_NAME 2>/dev/null || true

# Start new container
echo "Starting new container..."
docker run -d \
  --name $CONTAINER_NAME \
  -p 3000:3000 \
  -e APP_VERSION=$VERSION \
  $IMAGE_NAME:$VERSION

# Wait for startup
echo "Waiting for application to start..."
sleep 3

# Verify deployment
if curl -f http://localhost:3000/health > /dev/null 2>&1; then
  echo "✅ Deployment successful! Version $VERSION is running"
else
  echo "❌ Deployment failed - health check failed"
  exit 1
fi
