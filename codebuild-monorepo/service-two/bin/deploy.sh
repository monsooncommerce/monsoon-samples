#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

eval "$(../core/env/bin/resolve.sh)"

NODE_ENV=production bin/compile.sh
sed -i 'backup' -e 's/Handler: dist\//Handler: /g' dist/template.yaml
cp -R node_modules dist

aws cloudformation package \
  --template-file dist/template.yaml \
  --s3-bucket "${AWS_NAMESPACE}-service-two-lambda" \
  --output-template-file cloudformation/template-packaged.yaml

aws cloudformation deploy \
  --template-file cloudformation/template-packaged.yaml \
  --stack-name "${AWS_NAMESPACE}-service-two" \
  --capabilities CAPABILITY_NAMED_IAM \
  --no-fail-on-empty-changeset \
  --parameter-overrides \
    AwsNamespace="${AWS_NAMESPACE}" \
    NodeEnv="${NODE_ENV}"
