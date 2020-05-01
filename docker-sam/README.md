# Dockerized SAM

An example of running a [TypeScript](https://www.typescriptlang.org/) NodeJS [AWS Lambda Function](https://aws.amazon.com/lambda/) within [AWS Serverless Application Model (AWS SAM)](https://github.com/awslabs/serverless-application-model) via a [Docker](https://www.docker.com/) container.

## Getting Started

### Prequisites

- [Docker](https://docs.docker.com/docker-for-mac/install/)


### Building Development Environment
```
bin/build.sh
```

### Running Development Environment
Compile TypeScript source (`src`) into ES6 compatible JavaScript (`dist`) for an AWS Lambda Node.js 10.x environment:
```
bin/compile.sh
```

Start AWS Lambda Node.js 10.x Emulator:
```
bin/start.sh
```

Invoking AWS Lambda running in Emulator:

```
cat example/example.json | bin/invoke.sh
```
