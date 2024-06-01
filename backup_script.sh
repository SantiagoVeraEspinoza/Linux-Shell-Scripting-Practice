#!/bin/bash

backup_dir="$(realpath $1)"

echo "Creating backup..."
tar -czvf "${backup_dir}/../backup$(date +"%Y_%m_%d-%H-%M-%S").tar" "${backup_dir}"

if [ $? -eq 0 ]; then
    echo "Backup created !";
else
    echo "Failed to create backup...";
fi