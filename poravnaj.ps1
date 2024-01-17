#!/bin/bash

for dir in *; do
    if [ -d "$dir" ]; then
        cd "$dir" || exit 1  # Enter the directory or exit if not possible
        ime_datoteke=$(find . -name 'unique*.fasta' -type f)
        
        if [ -z "$ime_datoteke" ]; then
            echo "Error: Unique fasta file not found in directory $dir"
            cd ..
            continue
        fi

        mafft --auto "$ime_datoteke" > "poravnato${dir}.fasta"
        cd ..
    fi
done
