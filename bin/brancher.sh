#!/bin/bash

# The MIT License (MIT)
# Copyright (c) 2016 Daniel Beard
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

set -e

# Usage ./brancher.sh {branch_regex}
if [ "$#" -ne 1 ]; then
    echo "Usage $0 {branch_regex}"
    exit 1
fi

# Colors
NO_COLOR='\033[0m'

GIT_REMOTE="origin"
REGEX="$1"
BRANCH_ARRAY=()

flush_branches() {
  echo ${BRANCH_ARRAY[@]} | xargs git push --delete origin 
  BRANCH_ARRAY=()
}

function control_c() {
  if [ ${#BRANCH_ARRAY[@]} -gt 0 ]; then
    read -s -r -p "You have branches marked for deletion, do you want to remove them? (y/n)" -n 1 option
    case "$option" in
    "y")
      flush_branches
      exit 0
      ;;
    "n")
      exit 0
      ;;
    esac
  fi
  exit 0
}

# trap keyboard interrupt (control-c)
trap control_c SIGINT EXIT

# Update
git fetch --all

# Prune stale local branches
git remote prune $GIT_REMOTE >/dev/null 2>&1

for remote in $(git branch -r); do

  if [[ "$remote" =~ $REGEX ]]; then

    # Last time the branch was touched
    DATE=$(git log --pretty=format:"%C(yellow)%ar%C(reset)" --max-count=1 "$remote")

    # If this branch is merged to master
    # tput setaf is used for generating text colors.
    MERGED_TEXT="$(tput setaf 1)Branch not merged to master $NO_COLOR" # red text
    BRANCH_HEAD_SHA=$(git rev-parse "$remote")
    MERGED_TO_MASTER=$(git log "$BRANCH_HEAD_SHA"..origin/master --ancestry-path --merges | wc -l)
    if [[ "$MERGED_TO_MASTER" -gt 0 ]]; then
      MERGED_TEXT="$(tput setaf 2) Branch merged to master $NO_COLOR" # green text
    fi

    # Print branch info
    printf "\n Branch %s\n" "$remote"
    echo -e " Last commit: ""$DATE"" \t\t ""$MERGED_TEXT"

    read -s -r -p "d to mark for deletion, s to skip, f to flush (delete) all branches marked for deletion" -n 1 option
    case "$option" in
    "d")
      BRANCH=$(echo "$remote" | sed s,\^origin/,,)
      BRANCH_ARRAY+=("$BRANCH")
      ;;
    "s")
      echo -e "\nSkipping branch\n"
      ;;
    "f")
      echo -e "\Deleting branches\n"
      flush_branches
      exit 0
      ;;
    *)
      echo -e "\nBad option, aborting!\n"
      exit 1
      ;;
    esac
  fi
done
