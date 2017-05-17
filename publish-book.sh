#!/bin/bash

DATE=$(date +%Y%m%d_%H%M%s)
TRAVIS_BRANCH="$1"
MAIN_REPO="taster-class"

if [ "$#" -ne 1 ]; then
	echo "Please provide a branch (master, london, scotland)"
	exit 1
fi

REPO_NAME="$MAIN_REPO-$TRAVIS_BRANCH"


git clone git@github.com:Code-Your-Future/$REPO_NAME.git
cp -a _book/* ./$REPO_NAME
cd $REPO_NAME
rm CyfSyllabus_rsa.enc
git config --global user.email "kabaros+cyf@gmail.com"
git config --global user.name "CYF bot"
git config --global push.default simple
git add . --all
git commit --allow-empty -m "$TRAVIS_COMMIT"
git push
