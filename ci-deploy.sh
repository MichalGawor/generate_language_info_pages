#!/bin/bash

git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

set -e

# generate language info pages
bash ./docker-run.sh ./lang_info_pages

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then exit 0; fi

# deploy generated pages to origin/lang-info-pages

# create tarball with generated language info pages
tar -cvfz lang_info_pages ./lang_info_pages/

echo "Travis tag: $TAVIS_TAG"
