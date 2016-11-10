#!/bin/bash
#
# Simple utility to cut the `release` branch from `master`.
# Also bumps the version and pushes a new tag.
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

# Update and push new version name.
init_with_warning "About to cut release version $1 from master."
cut_branch_with_version_bump 'release' 'master' "$1"

tag_string=''
if [ "$2" ]; then
  tag_string="v$1-$2"
else
  tag_string="v$1"
fi

push_tag "${tag_string}"

echo;
echo 'Done.'
