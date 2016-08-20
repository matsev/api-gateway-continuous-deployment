#!/usr/bin/env bash

# Helper scripts that
# Tests, packages, tests, executes Lambda itests, etc...
# Usage:
#   ./build-and-deploy-to-stage.sh build_number

set -e

cd "$( dirname "${BASH_SOURCE[0]}" )"

build_number=$1

echo -e "\n==================== Execute Tests =========================================\n"
./1-test.sh

echo -e "\n==================== Package Files =========================================\n"
./2-package.sh

echo -e "\n==================== Deploy Lambda =========================================\n"
./3-update-lambda.sh

echo -e "\n==================== Execute Lambda Integration Tests ======================\n"
./4-lambda-itest.sh

echo -e "\n==================== Publish Lambda Version ================================\n"
./5-publish-version.sh ${build_number}

echo -e "\n==================== Update STAGE Lambda Alias =============================\n"
./6-update-stage-alias.sh ${build_number}

echo -e "\n==================== Execute API Gateway Integration Tests =================\n"
./7-api-gateway-itest.sh
