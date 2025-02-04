#!/bin/bash

# Get the LaTeX file name from the first argument
TEX_FILE="$1"

# Check if a filename was provided
if [ -z "$TEX_FILE" ]; then
  echo "Error: Please provide the LaTeX filename as an argument."
  exit 1
fi

# Extract the file name without extension
TEX_FILE_NAME="${TEX_FILE%.*}"

# Path to the std.ist file (make this absolute if needed)
IST_FILE="lib/std.ist"  # Or an absolute path like "/path/to/your/lib/std.ist"

# Run makeindex
makeindex "$TEX_FILE_NAME.idx" -s "$IST_FILE"

# Run pdflatex
pdflatex -synctex=1 -interaction=nonstopmode "$TEX_FILE"

# (Optional) Clean up auxiliary files
rm "$TEX_FILE_NAME".{aux,ilg,ind,synctex.gz,fls,fdb_latexmk}
