#!/bin/bash
set -e

echo "Travis tag: ${TAVIS_TAG}"
echo "LANG_INFO_PAGES_TAG: ${LANG_INFO_PAGES_TAG}"

# generate language info pages
bash ./docker-run.sh ./lang_info_pages
tar -czf lang_info_pages-${LANG_INFO_PAGES_TAG} ./lang_info_pages/


if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then exit 0; fi

# deploy generated pages to origin/lang-info-pages

# create tarball with generated language info pages
tar -czf lang_info_pages-${LANG_INFO_PAGES_TAG} ./lang_info_pages/

echo "Travis tag: ${TAVIS_TAG}"
