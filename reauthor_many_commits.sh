#!/usr/bin/env sh

echo "THIS SCRIPT IS A WORK IN PROGRESS, IT DOES NOT WORK AS EXPECTED"

INCORRECT_EMAIL=$1
echo $INCORRECT_EMAIL

git filter-branch --env-filter 'if [ "$GIT_AUTHOR_EMAIL" = "incorrect@email" ]; then
     GIT_AUTHOR_EMAIL=correct@email;
     GIT_AUTHOR_NAME="Correct Name";
     GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL;
     GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"; fi' -- --all
