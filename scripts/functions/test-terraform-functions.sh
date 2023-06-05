#!/bin/bash
source ./git-functions.sh
source ./terraform-functions.sh

terraform_change=$(git-check-if-commit-changed-directory $1 $2 $3)
if [[  $terraform_change = true ]] ; then
    terraform-format-check ../build
fi


