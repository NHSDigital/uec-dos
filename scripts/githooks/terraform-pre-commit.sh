#!/bin/bash
source ./scripts/functions/git-functions.sh

TF_VERSION=1.4.6
PRECOMMIT=${PRECOMMIT:-true}
IAC_DIR=${IAC_DIR:-infrastructure}
BRANCH_NAME=${BRANCH_NAME:-$(git rev-parse --abbrev-ref HEAD)}

function main {
  if [[ $(git-check-if-commit-changed-directory $PRECOMMIT $BRANCH_NAME $IAC_DIR) ]] ; then
    cmd="fmt -recursive -check -list=true --diff $IAC_DIR"
    docker run \
      --volume=$PWD:/scan \
      --workdir=/scan \
		  hashicorp/terraform:$TF_VERSION $cmd
  fi

}

main $*
