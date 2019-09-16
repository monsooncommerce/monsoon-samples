# monsoon-samples
This repository contains code samples that the Monsoon Engineering have shared in their blog posts.

## Code Samples
### [Dockerized SAM](docker-sam)
An example of running a [TypeScript](https://www.typescriptlang.org/) NodeJS [AWS Lambda Function](https://aws.amazon.com/lambda/) within [AWS Serverless Application Model (AWS SAM)](https://github.com/awslabs/serverless-application-model) via a [Docker](https://www.docker.com/) container. See our article ["Running AWS SAM in a Docker Container"](https://medium.com/monsoon-engineering/running-aws-sam-in-a-docker-container-2491596672c2) for more detail.

### [MonoRepo CI/CD using CodeBuild and Git Branching Workflow](codebuild-monorepo)
A detailed example of CI/CD for deploying multiple services from a single MonoRepo using [CodeBuild](https://aws.amazon.com/codebuild/), [CloudFormation](https://aws.amazon.com/cloudformation/) and a [couple of environment variables](https://12factor.net/config). Using a few combinations of these basic environment variables, it’s simple and straightforward to model a standard Git branching workflow, as well as allow each developer to have their own personal Cloud Native development environment! See our article ["MonoRepo CI/CD using CodeBuild and Git Branching Workflow"](https://medium.com/@michael_andrews/monorepo-ci-cd-using-codebuild-and-git-branching-workflow-2f1025850139) for more detail.
