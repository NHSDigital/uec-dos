#!/bin/bash
source ./scripts/functions/git-functions.sh
set -e

BRANCH_NAME=$(git rev-parse --abbrev-ref HEAD)
BUILD_COMMIT_MESSAGE="$(cat $1)"

# check branch name and commit message
check_git_branch_name $BRANCH_NAME
check_git_commit_message "$BUILD_COMMIT_MESSAGE"


