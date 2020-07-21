#!/usr/bin/env sh

# This script formats a given commit message in a "JIRA-friendly" way. 
# It prepends the Ticket number to the commit.

if [[ "$1" == "-h" ]]; then
    echo "Example usage: '$0 fix: important feature'"
    echo "Output: 'MYPROJ-123 - feat: important feature'"
    exit 0
fi
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

TICKET_NUMBER=$(echo $CURRENT_BRANCH | grep -oh "[A-Z]*-[0-9]*" | head -1)

COMMIT_MESSAGE="$TICKET_NUMBER - $*"

git commit -m "$COMMIT_MESSAGE"
