#!/bin/bash

git config user.name "Travis CI"
git config user.email "$COMMIT_AUTHOR_EMAIL"

set -e

# generate language info pages
bash ./docker-run.sh ./lang_info_pages

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "travis" ]; then exit 0; fi

# deploy
git init
git add ./lang_info_pages
git commit -m "Deploy lang info pages"

git push --force https://${GITHUB_TOKEN}:x-oauth-basic@github.com/clarin-eric/generate_language_info_pages.git HEAD:lang-info-pages
