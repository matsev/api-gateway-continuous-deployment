# Continuous Deployment for AWS Lambda behind API Gateway

Sample project that shows how a set of bash scripts can be used to implement a continuous deployment pipeline for an AWS 
Lambda function that act as a backend for an AWS API Gateway configured by AWS CloudFormation.

Please read the [blog post](https://www.jayway.com/2016/09/07/continuous-deployment-aws-lambda-behind-api-gateway/) for details.


## CloudFormation Template

[cloudformation.template](cloudformation.template)


## Tools

In order to execute the scripts, you need to install the following tools:

- [AWS CLI](https://aws.amazon.com/cli/) (AWS Command Line Interface)
- [npm](https://www.npmjs.com/) (JavaScript package manager)
- [jq](https://stedolan.github.io/jq/) (JSON Command Line Processor)


## Scripts

| Script                                                                | Description                               |
| ----------------------------------------------------------------------| ----------------------------------------- |
| [0-create-stack.sh](scripts/0-create-stack.sh)                        | Creates the stack                         |
| [1-test.sh](scripts/1-test.sh)                                        | Executes unit tests                       |
| [2-package.sh](scripts/2-package.sh)                                  | Creates .zip                              |
| [3-update-lambda.sh](scripts/3-update-lambda.sh)                      | Updates Lambda                            |
| [4-lambda-itest.sh](scripts/4-lambda-itest.sh)                        | Executes Lambda integration tests         |
| [5-publish-version.sh](scripts/5-publish-version.sh)                  | Publishes Lambda version                  |
| [6-update-stage-alias.sh](scripts/6-update-stage-alias.sh)            | Update stage alias                        |
| [7-api-gateway-itest.sh](scripts/7-api-gateway-itest.sh)              | Executes API Gateway integration tests    |
| [8-update-prod-alias.sh](scripts/8-update-prod-alias.sh)              | Update prod alias                         |
| [build-and-deploy-to-stage.sh](scripts/build-and-deploy-to-stage.sh)  | Build pipeline script                     | 
| [update-alias.sh](scripts/update-alias.sh)                            | Support script used by other scripts      |

