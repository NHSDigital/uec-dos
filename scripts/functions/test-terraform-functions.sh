#!/bin/bash
export BRANCH_NAME=task/DPTS-2211_My_valid_branch
export PRECOMMIT=false
/bin/bash ./scripts/githooks/terraform-pre-commit.sh
if [[ $? = 1 ]]; then
    all_pass=1
fi


