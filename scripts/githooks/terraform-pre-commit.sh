#!/bin/bash
source ./scripts/functions/git-functions.sh
source ./scripts/functions/terraform-functions.sh
set -e

PRECOMMIT=true
IAC_DIR=infrastructure

# check for terraform changes and formatting
terraform_change=$(git-check-if-commit-changed-directory $PRECOMMIT "$BRANCH_NAME" $IAC_DIR)
if [[ $terraform_change = true ]] ; then
    terraform-format-check $IAC_DIR
fi
