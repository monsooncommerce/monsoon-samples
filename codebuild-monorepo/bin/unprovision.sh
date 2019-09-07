#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

eval "$(core/env/bin/resolve.sh)"

service-two/bin/unprovision.sh
service-one/bin/unprovision.sh
