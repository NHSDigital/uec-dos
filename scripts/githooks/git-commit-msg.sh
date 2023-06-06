#!/bin/bash
source ./scripts/functions/git-functions.sh
# set -e

exit_code=0
#BRANCH_NAME=${BRANCH_NAME:-$(git rev-parse --abbrev-ref HEAD)}
BUILD_COMMIT_MESSAGE=${BUILD_COMMIT_MESSAGE:-"$(cat $1)"}

# check branch name and commit message
# check_git_branch_name $BRANCH_NAME
#[ $? != 0 ] && exit_code=1 ||:
# echo $exit_code
check_git_commit_message "$BUILD_COMMIT_MESSAGE"
[ $? != 0 ] && exit_code=1 ||:
exit 1

# exit $exit_code
