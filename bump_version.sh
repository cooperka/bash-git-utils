#!/bin/bash
#
# Simple utility to bump the version and commit the change (locally).
#
# @param $1 New version number to bump to.

# Change to the directory where this script is stored.
cd "$(dirname ${BASH_SOURCE[0]})"

# Load common methods to call.
source ./git_utils

# Validate input.
if [[ ! "$1" =~ ^[0-9\.]+$ ]]; then
  echo "Invalid params."
  echo "Usage: ./$(basename $0) <version>, e.g. ./$(basename $0) 1.0.2"
  exit 1
fi

init "About to bump version to $1 and commit locally."

echo;
bump_version "$1" "${PWD}"
