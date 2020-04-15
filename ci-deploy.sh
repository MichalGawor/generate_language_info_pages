#!/bin/bash
set -e

echo "Lang pages: ${LANGUAGE_PAGES_VERSION}"

# generate language info pages
bash ./docker-run.sh ./lang_info_pages
tar -czfv lang_info_pages_${LANGUAGE_PAGES_VERSION}.tar.gz /tmp/lang_info_pages/


if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then exit 0; fi

# create tarball with generated language info pages

