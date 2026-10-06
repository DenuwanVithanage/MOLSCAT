#!/usr/bin/env bash
set -euo pipefail

# Usage: ./batch_even_sums.sh <col6_value> <col5_min> <col5_max>
# Example: ./batch_even_sums.sh 28 1 105
# This will call: ./seperate_sum.sh J0 28 1 105, J2 28 1 105, ... J400 ...

if [[ $# -lt 3 ]]; then
  echo "Usage: $0 <col6_value> <col5_min> <col5_max>" >&2
  exit 1
fi

col6_value="$1"
col5_min="$2"
col5_max="$3"

for ((J=0; J<=400; J+=2)); do
  file="J${J}"
  # Capture the sum printed by your existing script
  if sum_out=$(./seperate_sum.sh "$file" "$col6_value" "$col5_min" "$col5_max" 2>/dev/null); then
    # Print: J <tab> sum
    echo -e "${J}\t${sum_out}"
  else
    # If a file is missing or an error occurs, still print the J with NaN to keep indexing aligned
    echo -e "${J}\tNaN" >&2
  fi
done

