#!/bin/bash

script_dir="$(dirname "$(readlink -f "$0")")"
folder_path="${script_dir}/script6"

# Create a folder
mkdir -p $folder_path

# Create files with different modification dates
touch -d "2024-01-01 10:00:00" $folder_path/file1.txt
touch -d "2023-12-25 15:30:00" $folder_path/file2.txt
touch -d "2023-11-15 08:45:00" $folder_path/file3.txt
touch -d "2023-10-10 12:00:00" $folder_path/file4.txt
touch -d "2023-09-05 17:20:00" $folder_path/file5.txt

# Optionally, list the files with their modification dates
ls -l $folder_path
