#!/bin/bash
source ./scripts/functions/git-functions.sh

exit_code=0
BUILD_COMMIT_MESSAGE=${BUILD_COMMIT_MESSAGE:-"$(cat $1)"}

exit_code=check_git_commit_message "$BUILD_COMMIT_MESSAGE"

exit $exit_code
