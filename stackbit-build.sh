#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://stg-api.stackbit.com/project/5f60c7d4d5fad1001c7ef53f/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://stg-api.stackbit.com/pull/5f60c7d4d5fad1001c7ef53f
curl -s -X POST https://stg-api.stackbit.com/project/5f60c7d4d5fad1001c7ef53f/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://stg-api.stackbit.com/project/5f60c7d4d5fad1001c7ef53f/webhook/build/publish > /dev/null
