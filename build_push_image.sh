#!/bin/bash

# Stop execution if an error occurs
set -e

# variables
IMAGE_NAME="item-app"
IMAGE_VERSION="v1"
GITHUB_USERNAME="lastdough" 
GITHUB_REPO="a433-microservices" 

# Step 1: Build the image with 'item-app' as the image name
docker build -t ${IMAGE_NAME}:${IMAGE_VERSION} .

# Step 2: List local Docker images
docker images

# Step 3: Tag the item-app image

# Using the following format as specified in the documentation
# docker tag IMAGE_NAME ghcr.io/NAMESPACE/NEW_IMAGE_NAME:TAG

# As per the documentation, NAMESPACE refers to the name of the personal account or organization to which the package will be scoped.
docker tag ${IMAGE_NAME}:${IMAGE_VERSION} ghcr.io/${GITHUB_USERNAME}/${GITHUB_REPO}/${IMAGE_NAME}:${IMAGE_VERSION}

# Step 4: Log in to GitHub Package and automatically input the GitHub token from the environment variable.
echo "$GITHUB_TOKEN" | docker login ghcr.io -u ${GITHUB_USERNAME} --password-stdin

# Step 5: Push the image to GitHub Package Registry

# Using the following format as specified in the documentation
# docker push ghcr.io/NAMESPACE/IMAGE-NAME:TAG
docker push ghcr.io/${GITHUB_USERNAME}/${GITHUB_REPO}/${IMAGE_NAME}:${IMAGE_VERSION}

# Indicate that the execution has finished
echo "Docker image has been built and pushed to GitHub Packages successfully."