#!/bin/bash
set -e
set -o pipefail
declare -a mandatory_env_vars=("NPM_TOKEN" "NODE_AUTH_TOKEN" "GITHUB_REF" "SECRET_GITHUB_TOKEN" "GITHUB_ACTOR" "GITHUB_REPOSITORY" "GITHUB_SERVER_URL" "GITHUB_REPOSITORY")

echo "Validating params..."

# Validating params
for var in "${mandatory_env_vars[@]}"
do
    if [ -z "${!var}" ]; then
        echo "Didn't find the env var: \"$var\", exiting..."
        exit 1
    fi
done

echo "Params are OK!"
