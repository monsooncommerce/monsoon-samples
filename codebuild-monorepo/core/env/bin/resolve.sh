#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/../../.." > /dev/null

# Environment Variable Resolution Order
# - Default (.env)
# - Current (export)
# - Override (.env.secret)
# - AWS_ENV (for initial AWS_NAMESPACE)
# - CloudFormation Export
# - AWS_ENV (to override existing CloudFormation)

CURRENT_ENV=$(mktemp)
export > "${CURRENT_ENV}"

if [ -f .env ]; then
  set -o allexport
  # shellcheck source=/dev/null
  source .env
  set +o allexport
fi

if [ -f "${CURRENT_ENV}" ]; then
  set -o allexport
  # shellcheck source=/dev/null
  source "${CURRENT_ENV}"
  set +o allexport
  rm "${CURRENT_ENV}"
fi

if [ -f "$AWS_ENV" ]; then
  set -o allexport
  # shellcheck source=/dev/null
  source "$AWS_ENV"
  set +o allexport
fi

if [ -f .env.secret ]; then
  set -o allexport
  # shellcheck source=/dev/null
  source .env.secret
  set +o allexport
fi

if [[ -z "$AWS_NAMESPACE" ]]; then
    >&2 echo "AWS_NAMESPACE is not set"
    exit 1
fi

if [[ "${AWS_NAMESPACE}" != 'local' ]]; then
  for e in $(core/env/bin/cloudformation.sh); do
    export "${e?}"
  done
fi

if [ -f "$AWS_ENV" ]; then
  set -o allexport
  # shellcheck source=/dev/null
  source "$AWS_ENV"
  set +o allexport
fi

if [[ "$AWS_PROFILE" ]]; then
  echo "export AWS_PROFILE='${AWS_PROFILE}'"
fi
echo "export AWS_NAMESPACE='${AWS_NAMESPACE}'"
echo "export NODE_ENV='${NODE_ENV}'"
echo "export GIT_BUILD_BRANCH_FILTER='${GIT_BUILD_BRANCH_FILTER}'"
echo "export GIT_DEPLOY_BRANCH_FILTER='${GIT_DEPLOY_BRANCH_FILTER}'"
echo "export SERVICE_TWO_STREAM='${SERVICE_TWO_STREAM}'"
