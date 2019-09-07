#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/../../.." > /dev/null

if [[ -z "$AWS_NAMESPACE" ]]; then
    echo "AWS_NAMESPACE is not set"
    exit 1
else
    echo "AWS_NAMESPACE: $AWS_NAMESPACE"
fi

SKIP_BUILD=$("core/codebuild/bin/skip_build.sh")
if [ "true" == "$SKIP_BUILD" ]; then
  exit 0
fi

GIT_BRANCH=$("core/codebuild/bin/git_branch.sh")
if [[ "$GIT_BRANCH" =~ $GIT_DEPLOY_BRANCH_FILTER ]]; then
  AWS_NAMESPACE=$AWS_NAMESPACE service-one/bin/deploy.sh
fi
