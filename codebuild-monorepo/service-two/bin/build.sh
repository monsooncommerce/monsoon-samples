#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

docker-compose build "${@}"
