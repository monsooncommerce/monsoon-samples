#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/../../.." > /dev/null

# shellcheck disable=SC2044
for file in $(find . -name BUILDME.md); do
  date > "${file}"
done
