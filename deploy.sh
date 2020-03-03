#!/bin/bash

git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

set -e

OUTPUT_DIR="$1"
# generate language info pages
bash ./docker-run.sh -m "$1"

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "travis" ]; then exit 0; fi
# deploy
cd OUTPUT_DIR
git init
git add .
git commit -m "Deploy language info pages"

git push --force https://${GITHUB_TOKEN}:x-oauth-basic@github.com/clarin-eric/resource-families-html-generator.git HEAD:lang-info-pages