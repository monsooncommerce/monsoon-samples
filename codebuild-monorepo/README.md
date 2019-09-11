### Provisioning and Deploying to AWS Environment
1. Create an environment file (`AWS_ENV`):
```
$ cat development.env.sh
AWS_PROFILE=development
AWS_NAMESPACE=sample
NODE_ENV=production
GIT_BUILD_BRANCH_FILTER='.*'
GIT_DEPLOY_BRANCH_FILTER='^development$'
```

2. Provision CodeBuild instances for environment:
```
AWS_ENV=development.env.sh bin/provision.sh
```

3. Trigger build on a branch that matches `GIT_BUILD_BRANCH_FILTER`:
```
git checkout -b development
date > service-two/BUILDME.md
date > service-one/BUILDME.md
git add -A
git commit -m 'Trigger build'
git push origin development
```

4. Once all the CodeBuild projects have successfully deployed, initiate a final `bin/provision.sh` to set CloudFormation Export variables, and initiate a final deploy:
```
AWS_ENV=development.env.sh bin/provision.sh
git checkout -b development
date > service-two/BUILDME.md
date > service-one/BUILDME.md
git add -A
git commit -m 'Trigger build'
git push origin development
```
