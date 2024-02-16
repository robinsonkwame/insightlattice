#!/bin/bash

PDF_DIR="./pdf"
MARKDOWN_DIR="./md"

# Convert to absolute paths and handle directories with spaces
PDF_DIR_SANITIZED=$(eval echo "$PDF_DIR" | sed 's/ /\\ /g' | xargs realpath)
MARKDOWN_DIR_SANITIZED=$(eval echo "$MARKDOWN_DIR" | sed 's/ /\\ /g' | xargs realpath)

cd marker && ./build_me.sh && cd ..

USER_ID=$(id -u)
GROUP_ID=$(id -g)

docker run --shm-size=10.24gb --gpus all -v "$PDF_DIR_SANITIZED":/pdfs --user $USER_ID:$GROUP_ID marker:latest python convert.py /pdfs/ /pdfs/

mv $PDF_DIR_SANITIZED/*.md $MARKDOWN_DIR