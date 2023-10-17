#!/bin/bash

# Straight to main directory
cd ~/getting-started-app

# Get the ID of the most recent container
container_id=$(docker ps -q -l)

if [ -n "$container_id" ]; then
    # Stop and remove the most recent container
    docker stop "$container_id"
    docker rm "$container_id"
    echo "Container $container_id has been stopped and removed."
else
    echo "No containers found."
fi

# Build the Docker image
docker build -t getting-started .

# Run a new container
docker run -dp 80:3000 getting-started

echo "Docker build and run completed."

