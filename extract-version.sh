#!/usr/bin/env bash

branch_name="${GITHUB_REF#refs/heads/}"
echo "branch_name=${branch_name}"

if [[ "$branch_name" =~ release/([0-9]+\.[0-9]+\.[0-9]+) ]]; then
  version="${BASH_REMATCH[1]}"
  echo "Extracted Version: $version"
  echo "RELEASE_VERSION=${version}" >> ${GITHUB_ENV}
else
  echo "RELEASE_VERSION=${branch_name}" >> ${GITHUB_ENV}
fi