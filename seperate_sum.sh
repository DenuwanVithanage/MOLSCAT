#!/bin/bash

# Usage: ./filter_data.sh input_file.txt col6_value col5_min col5_max

input_file="$1"
col6_value="$2"
col5_min="$3"
col5_max="$4"

# Check if input file is provided
if [ -z "$input_file" ]; then
    echo "Error: No input file provided."
    exit 1
fi

# Filter rows, skip col5 == col6, and sum column 7
awk -v col5_min="$col5_min" -v col5_max="$col5_max" -v col6_value="$col6_value" '
    $6 == col6_value && $5 >= col5_min && $5 <= col5_max && $5 != $6 {
        total += $7
    }
    END {
        print total
    }
' "$input_file"

