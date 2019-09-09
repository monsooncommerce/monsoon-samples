#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/../.." > /dev/null

SKIP_BUILD=$("core/codebuild/bin/skip_build.sh")

if [ "true" == "$SKIP_BUILD" ]; then
  exit 0
fi

service-two/bin/test.sh
