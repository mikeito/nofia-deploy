#!/bin/bash

# Define the base directory where the tar files are located
BASE_DIR="/home/itoli_michel/projects"

# List of images and their tar files
declare -A images
images=(
    ["nofia"]="nofia.tar"
    ["auth"]="auth.tar"
    ["gateway"]="gateway.tar"
)

# Function to load a Docker image from a tar file
load_image() {
    local image_name=$1
    local tar_file=$2
    if [ -f "$BASE_DIR/$tar_file" ]; then
        echo "### Loading Docker image: $image_name from $tar_file ###"
        docker load -i "$BASE_DIR/$tar_file"
        echo "### Docker image $image_name loaded successfully! ###"
    else
        echo "### Error: $tar_file not found in $BASE_DIR! Skipping... ###"
    fi
}

# Make the script executable (if it isn't already)
# echo "### Making the script executable ###"
# chmod +x "$0"

# Load all images
for image in "${!images[@]}"; do
    load_image "$image" "${images[$image]}"
done

echo "All images processed!"

# All containers ########
docker compose -f deploy-compose.yml up -d --renew-anon-volumes
