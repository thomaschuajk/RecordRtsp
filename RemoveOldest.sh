#!/bin/bash

# Specify the directory where you want to delete the oldest file
directory="/path/to/your/directory"

# Check if the directory exists
if [[ ! -d "$directory" ]]; then
    echo "Directory does not exist: $directory"
    exit 1
fi

# Change to the directory
cd "$directory" || exit 1

# Get the number of MP4 files
mp4_count=$(find "$directory" -type f -name "*.mp4" | wc -l)

if [[$mp4_count -gt 3]]; then
    DeleteOldest
fi

function DeleteOldest(){
    # Find the oldest file and delete it
    oldest_file=$(ls -t1 | tail -n 1)
    if [ -n "$oldest_file" ]; then
        rm "$oldest_file"
        echo "Deleted the oldest file: $oldest_file"
    else
        echo "No files found in the directory."
    fi

}


