#!/usr/bin/env sh

# I often find myself needing to get the latest changes of the develop branch, 
# to merge it into my current branch. This script lets you pull the develop 
# branch from any other branch.

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

STASHED_CHANGES=$(git stash | wc -w)
echo "Changes have been stashed"

git checkout develop
git pull
git checkout $CURRENT_BRANCH

if [ $STASHED_CHANGES -gt 5 ] 
then
    git stash pop
    echo "Changes have been unstashed"
fi

echo "Pull complete"
