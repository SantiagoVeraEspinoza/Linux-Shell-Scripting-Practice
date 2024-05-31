#!/bin/bash

count_occurrences() {
    local file="$1"
    local search_string="$2"
    local count=$(grep -o -F "$search_string" "$file" | wc -l)
    echo "$count"
}

directory=$1
search_string=$2

total_count=0

for file in "$directory"/*.txt; do
    if [ -f "$file" ]; then
        filename=$(basename "$file")
        count=$(count_occurrences "$file" "$search_string")
        total_count=$((total_count + count))
    fi
done

echo "Total occurrences of '$search_string': $total_count"