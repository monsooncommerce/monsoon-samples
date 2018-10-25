#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

CMD=$(cat <<'SH'
mkdir -p dist &&
cp src/template.yaml dist &&
npm install &&
npm run tsc --project tsconfig.json
SH
)

docker-compose run --rm lambda_npm_app sh -c "${CMD}"
