#!/bin/sh

function stripColors {
  echo "${1}" | sed 's/\x1b\[[0-9;]*m//g'
}

env
echo "1: ${1}"
cd ${1}
pwd
ls -hal

terraform init
# terraform validate

echo "HERE"

data="#### \`terraform plan\` ${planCommentStatus}
<details><summary>Show Output</summary>
{
    \"some\": {
        \"json\": true
    },
    \"even\": [\"more\"]
}
</details>
Some more text"

data=$(stripColors "${data}")
planPayload=$(echo "${data}" | jq -R --slurp '{body: .}')

planCommentsURL=$(cat ${GITHUB_EVENT_PATH} | jq -r .pull_request.comments_url)
echo "${planPayload}"
echo "${planCommentsURL}"

echo "${planPayload}" | curl -s -S -H "Authorization: token ${GITHUB_TOKEN}" --header "Content-Type: application/json" --data @- "${planCommentsURL}"
