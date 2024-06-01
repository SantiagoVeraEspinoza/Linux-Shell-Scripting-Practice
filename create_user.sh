#!/bin/bash

# Function to display usage information
usage() {
    echo "Usage: $0 username password group"
    exit 1
}

# Check if the correct number of arguments is provided
if [ $# -ne 3 ]; then
    usage
fi

# Assign arguments to variables
USERNAME=$1
PASSWORD=$2
GROUP=$3

# Check if the group exists; if not, create it
if ! getent group "$GROUP" >/dev/null; then
    echo "Group '$GROUP' does not exist. Creating the group..."
    groupadd "$GROUP"
    if [ $? -ne 0 ]; then
        echo "Failed to create group '$GROUP'. Exiting..."
        exit 1
    fi
fi

# Create the user and add them to the specified group
useradd -m -g "$GROUP" "$USERNAME"
if [ $? -ne 0 ]; then
    echo "Failed to create user '$USERNAME'. Exiting..."
    exit 1
fi

# Set the user's password
echo "$USERNAME:$PASSWORD" | chpasswd
if [ $? -ne 0 ]; then
    echo "Failed to set password for user '$USERNAME'. Exiting..."
    exit 1
fi

echo "User '$USERNAME' created and added to group '$GROUP' successfully."