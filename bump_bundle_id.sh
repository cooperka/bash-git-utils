#!/bin/bash
#
# Simple utility to bump the CodePush bundle ID and commit the change (locally).
#
# @param $1 Current version number.
# @param $2 CodePush iteration tag.

# Validate input.
if [[ "$#" -lt 1 || "$#" -gt 2 ]] || [[ ! "$1" =~ ^[0-9\.]+$ ]]; then
  echo "Invalid params."
  echo "Usage: $(basename $0) <version> [<tag-suffix>], e.g. $(basename $0) 1.0.2 1"
  exit 1
fi

# Change to the directory where this script is stored.
cd "$(dirname ${BASH_SOURCE[0]})"

# Load common methods to call.
source ./git_utils

init_safe "About to bump CodePush bundle ID and commit locally. Any existing tag will be overwritten."

echo;
perform_bundle_bump "${PWD}/../.."

git tag -f "maint-v$1-cp$2"

echo;
echo 'Done.'
