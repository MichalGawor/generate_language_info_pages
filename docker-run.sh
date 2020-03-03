#!/bin/bash

set -e

if [ $# -lt 1 ]; then
	echo -e "Please specify an existing output directory:\n\n\t$0 <output directory>\n"
	exit 1
fi

OUTPUT_DIR="$1"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

mkdir -p "${OUTPUT_DIR}"
TMP_DIR="${OUTPUT_DIR}/.tmp-$(date +%Y%m%d%H%M%S)"

if [ -e "${TMP_DIR}"/* ]; then
	echo "Noise found in temporary directory ${TMP_DIR}, please remove manually. Aborted"
	exit 1
fi

mkdir -p "${OUTPUT_DIR}"

# Build
(cd "${SCRIPT_DIR}" && docker build --tag "generate_language_info_pages:latest" .)

echo "Build finished"

# Run
docker run --rm -v "${TMP_DIR}":"/tmp" "generate_language_info_pages:latest"

# Check output
if [ -d "${TMP_DIR}" ]; then
  mv "${TMP_DIR}"/* "${OUTPUT_DIR}"
  echo -e "\nResult available in ${OUTPUT_DIR}"
  rmdir "${TMP_DIR}"
else
  echo "ERROR: No result found in ${OUTPUT_DIR}"
fi
