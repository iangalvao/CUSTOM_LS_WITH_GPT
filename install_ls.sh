#!/bin/bash

# Set the target directory for installation
INSTALL_DIR="/usr/local/bin"

# Define the source script
SOURCE_SCRIPT="ls.py"

# Ensure we have permissions
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run as root to install."
    exit 1
fi

# Copy the script to the install directory
cp "$SOURCE_SCRIPT" "$INSTALL_DIR/ls" || {
    echo "Failed to copy the script. Ensure $SOURCE_SCRIPT exists."
    exit 1
}

# Make it executable
chmod +x "$INSTALL_DIR/ls" || {
    echo "Failed to set executable permissions."
    exit 1
}

echo "Custom ls command installed successfully!"
