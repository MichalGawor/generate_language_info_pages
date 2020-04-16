#!/bin/bash
set -e

echo "Generating ${LANGUAGE_PAGES_VERSION} language info pages"
bash ./docker-run.sh ./lang_info_pages
