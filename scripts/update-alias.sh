#!/usr/bin/env bash

# Creates or updates a Lambda alias to point to the specified build number
#
# Usage:
#   update-alias.sh build_number alias

set -e

lambda_name=GreetingLambda
build_number=$1
alias=$2

if [ -z "$AWS_DEFAULT_REGION" ]; then
    aws_region="eu-west-1"
else
    aws_region=$AWS_DEFAULT_REGION
fi


# Lookup the Lambda version provided by AWS by looking at the build_number in the description
lambda_version=$(aws lambda list-versions-by-function --function-name $lambda_name --region $aws_region --output json| jq -r ".Versions[] | select(.Version!=\"\$LATEST\") | select(.Description == \"${build_number}\").Version")
echo "Found matching Lambda version $lambda_version for build number $build_number"

# Update existing alias to point to the Lambda version
echo "Updating alias $alias for Lambda $lambda_name"
aws lambda update-alias --function-name $lambda_name --name $alias --function-version $lambda_version --description $build_number --region $aws_region
