#!/bin/bash
set -e

if [ -z "${TRAVIS_TAG}" ]; then
		echo "TRAVIS_TAG variable not set, skipping build"
		exit 0
	else
		echo "Tag: ${TRAVIS_TAG}"
fi

echo "Generating language info pages"
bash ./docker-run.sh ./lang_info_pages
