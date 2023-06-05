#!/bin/bash
source ./scripts/functions/git-functions.sh
source ./scripts/functions/terraform-functions.sh
set -e


IAC_DIR=infrastructure
PRECOMMIT=${PRECOMMIT:-true}
BRANCH_NAME=${BRANCH_NAME:-$(git rev-parse --abbrev-ref HEAD)}

# check for terraform changes and formatting
terraform_change=$(git-check-if-commit-changed-directory $PRECOMMIT "$BRANCH_NAME" $IAC_DIR)
if [[ $terraform_change = true ]] ; then
    terraform-format-check $IAC_DIR
fi
