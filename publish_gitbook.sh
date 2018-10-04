#!/bin/bash

# this script refers from https://github.com/steveklabnik/automatically_update_github_pages_with_travis_example

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
	echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
	exit 0
fi

rev=$(git rev-parse --short HEAD)
cd _book

git init
git config user.name "yilv"
git config user.email "yi.lv@odd-e.com"

git remote add upstream "https://$GITHUB_TOKEN@github.com/yilv/LargeScaleProductDevelopmentOrganization.git"
git fetch upstream
git reset upstream/gh-pages

touch .

git add -A .
git commit -m "rebuild pages at $rev"
git push -q upstream HEAD:gh-pages

echo "done!"

## - END -
