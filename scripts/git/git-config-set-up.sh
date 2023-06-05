#!/bin/bash

# move to a git function ?
rm -f .git/hooks/commit-msg
cp scripts/git/commit-msg .git/hooks/commit-msg
chmod +x .git/hooks/commit-msg
