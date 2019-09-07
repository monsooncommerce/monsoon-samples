#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

curl \
  --request POST \
  --header "Content-Type: application/json" \
  --data @- \
  http://localhost:3001/2015-03-31/functions/ServiceOneFunction/invocations
