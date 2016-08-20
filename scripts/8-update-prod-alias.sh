#!/usr/bin/env bash

# Updates the PROD alias to point to the Lambda version with the build number as description
#
# Usage:
#   7-update-prod-alias.sh build_number

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

build_number=$1
alias="PROD"

./update-alias.sh ${build_number} ${alias}
