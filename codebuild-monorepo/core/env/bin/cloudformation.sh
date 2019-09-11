#!/bin/bash
set -o errexit
pushd "$(cd "$(dirname "$0")" ; pwd -P )/.." > /dev/null

if [[ -z "$AWS_NAMESPACE" ]]; then
    echo "AWS_NAMESPACE is not set"
    exit 1
fi

while IFS=$'\n' read -r line; do
  IFS=',' read -r -a array <<< "$line"
  key="${array[2]}"
  val="${array[3]}"
  case $key in
    "${AWS_NAMESPACE}-service-two-stream")
      echo "SERVICE_TWO_STREAM=${val}"
      ;;
  esac
done < <(aws cloudformation list-exports --output text | tr '\t' ',')
