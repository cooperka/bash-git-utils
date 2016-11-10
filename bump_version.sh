#!/bin/bash
#
# Simple utility to bump the version and commit the change (locally).
#
# @param $1 New version number to bump to.
# @param $2 (optional) Extra string to add as a tag suffix.

# Validate input.
if [[ "$#" -lt 1 || "$#" -gt 2 ]] || [[ ! "$1" =~ ^[0-9\.]+$ ]]; then
  echo "Invalid params."
  echo "Usage: $(basename $0) <version> [<tag-suffix>], e.g. $(basename $0) 1.0.2 rc1"
  exit 1
fi

# Change to the directory where this script is stored.
cd "$(dirname ${BASH_SOURCE[0]})"

# Load common methods to call.
source ./git_utils

init_safe "About to bump version to $1 and commit locally. Any existing tag will be overwritten."

echo;
perform_version_bump "$1" "${PWD}/../.."

tag_string=''
if [ "$2" ]; then
  tag_string="v$1-$2"
else
  tag_string="v$1"
fi

git tag -f "${tag_string}"

echo;
echo 'Done.'
