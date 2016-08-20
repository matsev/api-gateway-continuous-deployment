#!/usr/bin/env bash

# Updates the STAGE alias to point to the Lambda version with the build number as description
#
# Usage:
#   6-update-stage-alias.sh build_number

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

build_number=$1
alias="STAGE"

./update-alias.sh ${build_number} ${alias}
