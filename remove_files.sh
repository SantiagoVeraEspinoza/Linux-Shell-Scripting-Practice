#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 directory days"
    echo "Example: $0 /path/to/directory 30"
    exit 1
}

# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    usage
fi

# Assign arguments to variables
DIRECTORY=$1
DAYS=$2

# Check if the directory exists
if [ ! -d "$DIRECTORY" ]; then
    echo "Directory '$DIRECTORY' does not exist. Exiting..."
    exit 1
fi

# Check if the days argument is a valid number
if ! [[ "$DAYS" =~ ^[0-9]+$ ]]; then
    echo "Days argument '$DAYS' is not a valid number. Exiting..."
    exit 1
fi

# Find and delete files older than the specified number of days
find "$DIRECTORY" -type f -mtime +$DAYS -exec rm -f {} \;

# Check if the find command was successful
if [ $? -eq 0 ]; then
    echo "Files older than $DAYS days have been deleted from '$DIRECTORY'."
else
    echo "Failed to delete files from '$DIRECTORY'."
    exit 1
fi