#!/bin/bash

GIT_BRANCH=$(git symbolic-ref HEAD --short 2>/dev/null) || true
if [ "${GIT_BRANCH}" == "" ] ; then
  GIT_BRANCH=$(git branch -a --contains HEAD | sed -n 2p | awk '{ printf $1 }') || true
  GIT_BRANCH=${GIT_BRANCH#remotes/origin/}
fi

echo "$GIT_BRANCH"
