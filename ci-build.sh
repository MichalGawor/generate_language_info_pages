#!/bin/bash
set -e

echo "Generating ${LANGUAGE_PAGES_VERSION} language info pages"
bash ./docker-run.sh ./lang_info_pages

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then exit 0; fi