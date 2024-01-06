#!/bin/bash

# Function to display an error message and exit with a non-zero status
function exit_with_error {
    echo "Error: $1" >> error.log
    exit 1
}

# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    exit_with_error "Usage: $0 <source_file> <destination_directory>"
fi

# Assigning arguments to variables for better readability
source_file="$1"
destination_directory="$2"

# Check if the source file exists
if [ ! -f "$source_file" ]; then
    exit_with_error "Source file '$source_file' does not exist."
fi

# Check if the destination directory exists, create it if not
if [ ! -d "$destination_directory" ]; then
    mkdir -p "$destination_directory" || exit_with_error "Failed to create destination directory '$destination_directory'"
fi

# Copy the file to the destination directory
cp "$source_file" "$destination_directory" || exit_with_error "Failed to copy '$source_file' to '$destination_directory'"

# Perform additional processing (you can add your own logic here)

echo "File successfully copied and processed."
