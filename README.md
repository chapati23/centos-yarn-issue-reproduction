# How to reproduce the issue

### Prerequisites

You will need access to a private npm registry and its npm access token.

1. Open the `.npmrc` and replace the placeholders "choose-any-private-scope" and "<put-your-auth-token-here>" with real values
2. Open the `Dockerfile` and replace the last line with an existing package from your private scope

### Reproduce the error

1. `docker build --no-cache -t centos-yarn-issue .`
2. This should fail with the following error:

    ```
Step 13/13 : RUN yarn add @brickblock/eslint-config-base
 ---> Running in 90289e6c9d25
yarn add v1.5.1
info No lockfile found.
[1/4] Resolving packages...
[2/4] Fetching packages...
info If you think this is a bug, please open a bug report with the information provided in "/yarn-error.log".
info Visit https://yarnpkg.com/en/docs/cli/add for documentation about this command.
error An unexpected error occurred: "https://registry.yarnpkg.com/@brickblock/eslint-config-base/-/eslint-config-base-1.7.0.tgz: unexpected end of file".
The command '/bin/sh -c yarn add @brickblock/eslint-config-base' returned a non-zero code: 1    
    ```
    
### Reproduce the fixes

#### Fix 1: Downgrade to node 8

1. Follow the same prerequisites as above (choose a private package you have access to and replace placeholders in `.npmrc`)
1. `git checkout fixed-yarn-install-by-downgrading-to-node-8`
1. `docker build --no-cache -t centos-yarn-issue .`
1. This should succeed

#### Fix 2: Switch to `npm install`

1. Follow the same prerequisites as above (choose a private package you have access to and replace placeholders in `.npmrc`)
1. `git checkout fixed-by-using-npm-install`
1. `docker build --no-cache -t centos-yarn-issue .`
1. This should succeed