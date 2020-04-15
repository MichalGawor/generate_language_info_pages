#!/bin/bash
set -e

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then exit 0; fi

echo "Generating ${LANGUAGE_PAGES_VERSION} language info pages"
bash ./docker-run.sh ./lang_info_pages
