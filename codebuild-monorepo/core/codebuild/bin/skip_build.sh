#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/../../.." > /dev/null

GIT_BRANCH=$("core/codebuild/bin/git_branch.sh")

# Skipping build if current git changes are not under `$SUBPROJECT_NAME` directory.
FILES=$(git diff --name-only master..."$GIT_BRANCH")
skip_build=true

for f in $FILES; do
  if [[ $f =~ ^$SUBPROJECT_NAME/ ]] ; then
    skip_build=false
  fi
done

if [[ "$GIT_BRANCH" =~ $GIT_DEPLOY_BRANCH_FILTER ]] ; then
  skip_build=false
fi

echo $skip_build
