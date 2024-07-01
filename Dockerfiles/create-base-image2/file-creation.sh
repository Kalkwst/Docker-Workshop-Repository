#!/bin/bash

# Set the desired file size in bytes (80MB)
file_size=$((80 * 1024 * 1024))  # 80MB in bytes

# Generate a random temporary file name
temp_file=$(mktemp)

# Loop to generate random characters until file reaches desired size
while [ $(stat -c %s "$temp_file") -lt $file_size ]; do
    # Append random data from /dev/urandom to the temporary file
    dd if=/dev/urandom bs=1024 count=$(( (file_size - $(stat -c %s "$temp_file")) / 1024 )) 2>/dev/null >> "$temp_file"
done

# Create the final output file with random characters
output_file="random_data.txt"
cp "$temp_file" "$output_file"

# Remove temporary file
rm "$temp_file"

echo "File generated: $output_file"
