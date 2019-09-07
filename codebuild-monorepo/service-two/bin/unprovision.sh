#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

eval "$(../core/env/bin/resolve.sh)"

aws s3 rm "s3://${AWS_NAMESPACE}-service-two-lambda" --recursive || true

aws cloudformation delete-stack \
  --stack-name "${AWS_NAMESPACE}-service-two-s3"

aws cloudformation delete-stack \
  --stack-name "${AWS_NAMESPACE}-service-two-codebuild"
