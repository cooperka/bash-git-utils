#!/bin/bash
#
# Simple utility to bump the version and commit the change (locally).
#
# @param $1 New version number to bump to.

# Validate input.
if [[ ! "$1" =~ ^[0-9\.]+$ ]]; then
  echo "Invalid params."
  echo "Usage: $(basename $0) <version>, e.g. $(basename $0) 1.0.2"
  exit 1
fi

# Change to the directory where this script is stored.
cd "$(dirname ${BASH_SOURCE[0]})"

# Load common methods to call.
source ./git_utils

init_safe "About to bump version to $1 and commit locally."

echo;
perform_version_bump "$1" "${PWD}"
