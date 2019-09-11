#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/../../.." > /dev/null

if [[ -z "$AWS_ENV" ]]; then
  export AWS_NAMESPACE=local
fi

core/env/bin/resolve.sh
