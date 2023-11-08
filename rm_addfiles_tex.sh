#!/usr/bin/env bash

# Remove all additional files from LaTeX compilation and leave the compiled PDF
patterns=("*.4tc" "*.aux" "*.bbl" "*.bcf" "*.blg" "*.fdb_latexmk" "*.fls" "*.log" "*.out" "*.pdf" "*.run.xml" "*.tex" "*.tmp" "*.toc" "*.xref")

# Loop through the files and remove them if they exist
for file in pwd; do
	 for pattern in "${patterns[@]}"; do
        if [[ "$file" =~ $pattern ]]; then
            echo "Removing: $file"
            rm -f "$file"
        fi
    done
done
