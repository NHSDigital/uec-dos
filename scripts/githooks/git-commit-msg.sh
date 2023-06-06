#!/bin/bash
source ./scripts/functions/git-functions.sh
set -e

exit_code=0
BUILD_COMMIT_MESSAGE=${BUILD_COMMIT_MESSAGE:-"$(cat $1)"}

check_git_commit_message "$BUILD_COMMIT_MESSAGE"
echo $?
echo twr
exit $?

