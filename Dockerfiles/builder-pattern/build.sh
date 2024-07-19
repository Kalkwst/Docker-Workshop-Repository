set -x

IMAGE_NAME="helloapp"
BUILDER_IMAGE_NAME=$IMAGE_NAME"-builder"
IMAGE_TAG="latest"

echo "Building $BUILDER_IMAGE_NAME:$IMAGE_TAG"

# Clean up the existing build
rm -rf target

# Build the builder image
docker build -t $BUILDER_IMAGE_NAME:$IMAGE_TAG -f Dockerfile.build .
if [ $? -ne 0 ]; then
    echo "Failed to build $BUILDER_IMAGE_NAME:$IMAGE_TAG"
    exit 1
fi

# Create the container
docker create --name $BUILDER_IMAGE_NAME $BUILDER_IMAGE_NAME:$IMAGE_TAG
if [ $? -ne 0 ]; then
    echo "Failed to create $BUILDER_IMAGE_NAME:$IMAGE_TAG"
    exit 1
fi

# Copy the build output into the Docker host
docker cp $BUILDER_IMAGE_NAME:/app/HelloWorld.jar ./HelloWorld.jar

# Clean up the container
docker rm $BUILDER_IMAGE_NAME
docker rmi $BUILDER_IMAGE_NAME:$IMAGE_TAG

# Build the actual image
docker build -t $IMAGE_NAME:$IMAGE_TAG -f Dockerfile .