#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

eval "$(../core/env/bin/resolve.sh)"

aws cloudformation deploy \
  --template-file cloudformation/lambda-s3.yaml \
  --stack-name "${AWS_NAMESPACE}-service-one-s3" \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset \
  --parameter-overrides AwsNamespace="${AWS_NAMESPACE}"

aws cloudformation deploy \
  --template-file cloudformation/codebuild.yaml \
  --stack-name "${AWS_NAMESPACE}-service-one-codebuild" \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset \
  --parameter-overrides \
    AwsNamespace="${AWS_NAMESPACE}" \
    GitBuildBranchFilter="${GIT_BUILD_BRANCH_FILTER}" \
    GitDeployBranchFilter="${GIT_DEPLOY_BRANCH_FILTER}" \
    ServiceTwoStream="${SERVICE_TWO_STREAM}"
