#!/bin/bash

git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

set -e

# generate language info pages
bash ./docker-run.sh ./lang_info_pages

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then exit 0; fi

# deploy generated pages to origin/lang-info-pages


for file in ./*
do
    if [[ -f $file ]]; then
        echo "${file}"
    fi
done


tar -cvfz lang_info_pages ./lang_info_pages/

echo "Travis tag: ${TAVIS_TAG}"
