#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

git clean -f -d -x -e '.env.secret' .
