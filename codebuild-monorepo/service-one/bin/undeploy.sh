#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

eval "$(../core/env/bin/resolve.sh)"

aws cloudformation delete-stack \
  --stack-name "${AWS_NAMESPACE}-service-one"
