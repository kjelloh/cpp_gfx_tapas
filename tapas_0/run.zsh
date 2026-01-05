#!/bin/zsh

# Extract project name from CMakeLists.txt
if [[ ! -f "CMakeLists.txt" ]]; then
    echo "Error: CMakeLists.txt not found in current directory"
    exit 1
fi

PROJECT_NAME=$(grep -E "^project\(" CMakeLists.txt | sed -E 's/project\(([^ )]+).*/\1/')
if [[ -z "$PROJECT_NAME" ]]; then
    echo "Error: Could not extract project name from CMakeLists.txt"
    exit 1
fi

echo "Detected project name: $PROJECT_NAME"

# Read current preset from file, default to Debug if file doesn't exist
if [[ -f "preset.txt" ]]; then
    BUILD_TYPE=$(cat preset.txt)
    echo "Using preset from preset.txt: $BUILD_TYPE"
else
    BUILD_TYPE="Debug"
    echo "Warning: preset.txt not found, defaulting to Debug"
    echo "Run './init_tool_chain.zsh [Debug|Release]' first to set preset"
fi

# Validate build type
if [[ "$BUILD_TYPE" != "Release" && "$BUILD_TYPE" != "Debug" ]]; then
    echo "Error: Invalid preset in preset.txt: $BUILD_TYPE"
    echo "Run './init_tool_chain.zsh [Debug|Release]' to fix"
    exit 1
fi

# All script arguments are passed directly to executable (no shift needed)

# Define the build directory and workspace directory
BUILD_DIR="build/$BUILD_TYPE"
WORKSPACE_DIR="workspace"

echo "Running $BUILD_TYPE build..."

# Create the workspace directory if it doesn't exist
echo "Creating workspace directory..."
mkdir -p "$WORKSPACE_DIR"

# Build the project using cmake
echo "Building the project with cmake..."
cmake --build "$BUILD_DIR"

# Check if the build was successful
if [[ $? -ne 0 ]]; then
    echo "Build failed. Exiting."
    exit 1
fi

# Copy the built binary to the workspace directory
echo "Copying the '$PROJECT_NAME' binary to the workspace directory..."
if [[ ! -f "$BUILD_DIR/$PROJECT_NAME" ]]; then
    echo "Error: Executable '$PROJECT_NAME' not found in $BUILD_DIR"
    echo "Build may have failed or executable name doesn't match project name"
    exit 1
fi
cp "$BUILD_DIR/$PROJECT_NAME" "$WORKSPACE_DIR/"

# Change to the workspace directory
cd "$WORKSPACE_DIR"

./"$PROJECT_NAME" "$@"
