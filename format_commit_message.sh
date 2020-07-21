#!/usr/bin/env sh

# This script formats a given commit message in a "JIRA-friendly" way. 
# It prepends the Ticket number to the commit.

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

TICKET_NUMBER=$(echo $CURRENT_BRANCH | grep -oh "[A-Z]*-[0-9]*" | head -1)

echo $TICKET_NUMBER: $1
