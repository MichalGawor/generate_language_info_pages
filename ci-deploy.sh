#!/bin/bash
set -e

echo "Travis tag: (${TRAVIS_TAG})"
echo "Lang pages: ${LANGUAGE_PAGES}"

# generate language info pages
bash ./docker-run.sh ./lang_info_pages
tar -czf lang_info_pages ./lang_info_pages/


if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then exit 0; fi

# create tarball with generated language info pages
tar -czf lang_info_pages ./lang_info_pages/

