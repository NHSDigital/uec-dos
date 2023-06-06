#!/bin/bash
all_pass=0
export IAC_DIR="infrastructure"
/bin/bash ./scripts/githooks/terraform-pre-commit.sh

