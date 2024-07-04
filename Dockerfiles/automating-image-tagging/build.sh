#!/bin/bash 

# Read current version from version.txt 
current_version=$(cat version.txt) 

# Extract the major and minor versions, set patch to 0
major_version=$(echo $current_version | awk -F. '{print $1}')
minor_version=$(echo $current_version | awk -F. '{print $2}')
new_minor_version=$((minor_version + 1)) 
new_version="$major_version.$new_minor_version.0"

# Update version.txt with the new version 
echo $new_version > version.txt 

# Build the Docker image with the new version as a build argument 
docker build -t base-image:$new_version --build-arg VERSION=$new_version .