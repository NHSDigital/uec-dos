#!/bin/bash


/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "DR-1 My message takes exactly 72 characters to describe this new commit"
if [[ $? = 1 ]]; then
    exit 1
fi
/bin/bash pre-commit-git-checks.sh main "DR-1 My message takes exactly 72 characters to describe this new commit"
if [[ $? = 1 ]]; then
    exit 1
fi
# invalid - jira project ref
/bin/bash pre-commit-git-checks.sh task/D-22_My_valid_branch "DR-1 My valid commit message"
if [[ $? = 0 ]]; then
  exit 1
fi
# invalid - jira project ref
/bin/bash pre-commit-git-checks.sh task/DR2_My_valid_branch "DR-1 My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid - no initial cap
/bin/bash pre-commit-git-checks.sh task/DR-2_my_valid_branch "DR-1 My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid - jira ref too long
/bin/bash pre-commit-git-checks.sh task/DPTS-221111_My_valid_bran "DR-1 My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid - branch name too long
/bin/bash pre-commit-git-checks.sh task/DPTS-22111_My_valid_branch "DR-1 My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment - no jira ref
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment - incomplete jira ref
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "D-1 My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment -jira ref has no hyphen
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "DR1 My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment -jira ref too long
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "DR-111111 my valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment -no initial cap
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "DR-11 my valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment -no space after JIRA ref
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "DR-11My valid commit message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment - min three words
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "DR-11 My message"
if [[ $? = 0 ]]; then
    exit 1
fi
# invalid comment - too long
/bin/bash pre-commit-git-checks.sh task/DPTS-2211_My_valid_branch "DR-11 My message takes too many characters to describe the commit clearly"
if [[ $? = 0 ]]; then
    exit 1
fi
echo all tests pass
