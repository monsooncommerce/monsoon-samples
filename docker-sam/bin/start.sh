#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

function down() {
  docker-compose down
}
trap down EXIT

docker-compose up sam_app
