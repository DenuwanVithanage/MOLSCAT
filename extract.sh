#!/bin/bash

# Usage: ./extract_lines.sh input_file.txt output_file.txt energy

input_file="$1"
output_file="$2"
energy="$3"

# Check if input file is provided
if [ -z "$input_file" ]; then
    echo "Error: No input file provided."
    exit 1
fi

# Check if output file is provided
if [ -z "$output_file" ]; then
    echo "Error: No output file provided."
    exit 1
fi

grep "^[[:space:]]*$energy" "$input_file" | sed 's/D/E/g' > "$output_file"

# Use grep to find all lines starting with 500 and save them to the output file
