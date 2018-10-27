#!/bin/bash
set -o errexit

BASEDIR="$1"
/usr/local/bin/sam local start-lambda \
  --template dist/template.yaml \
  --host 0.0.0.0 \
  --docker-volume-basedir "${BASEDIR}" \
  --docker-network monsoon-samples_default \
  --skip-pull-image
