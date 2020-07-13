#!/usr/bin/env sh

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

STASHED_CHANGES=$(git stash | wc -w)
echo "Changes have been stashed"

git checkout develop
git pull
git checkout $CURRENT_BRANCH

if [ $STASHED_CHANGES -gt 5 ] 
then
    echo "Changes have been unstashed"
    git stash pop
fi

echo "Pull complete"
