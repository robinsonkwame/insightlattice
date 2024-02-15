#!/bin/bash

PDF_DIR="~/Downloads/theoretical and paradigmatic committments"
MARKDOWN_DIR="~/Documents/thesis/Paper 1 - Computation for Community-based Economies"

# Convert to absolute paths and handle directories with spaces
PDF_DIR_SANITIZED=$(eval echo "$PDF_DIR" | sed 's/ /\\ /g' | xargs realpath)
MARKDOWN_DIR_SANITIZED=$(eval echo "$MARKDOWN_DIR" | sed 's/ /\\ /g' | xargs realpath)

docker run -v "$PDF_DIR_SANITIZED":/pdfs dibz15/marker_docker:latest python convert_single.py /pdfs/hook-2015-knowledge-production.pdf /pdfs/hook-2015-knowledge-production.md --parallel_factor 2 --max_pages 10

mv *.md $MARKDOWN_DIR