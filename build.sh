#!/bin/bash
# Build script for Disentangle paper
# Usage: ./build.sh

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SOURCE="$SCRIPT_DIR/disentangle_paper.md"
OUTPUT="$SCRIPT_DIR/disentangle_paper.pdf"

pandoc "$SOURCE" \
  -o "$OUTPUT" \
  --pdf-engine=lualatex \
  -V mainfont="Times New Roman" \
  -V monofont="Menlo" \
  -V mathfont="STIX Two Math" \
  -V geometry:margin=1in \
  --toc \
  --toc-depth=2 \
  -N

if [ $? -eq 0 ]; then
  echo "Built: $OUTPUT"
  ls -lh "$OUTPUT"
else
  echo "Build failed"
  exit 1
fi
