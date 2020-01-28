#!/bin/sh

env
echo "1: ${1}"
cd ${1}
pwd
ls -hal

terraform init
terraform validate

data=planCommentWrapper="#### \`terraform plan\` ${planCommentStatus}
<details><summary>Show Output</summary>
{
    "some": {
        "json": true
    },
    "even": ["more"]
}
</details>
Some more text"
planCommentsURL=$(cat ${GITHUB_EVENT_PATH} | jq -r .pull_request.comments_url)
echo "${data}" | curl -s -S -H "Authorization: token ${GITHUB_TOKEN}" --header "Content-Type: application/json" --data @- "${planCommentsURL}" > /dev/null
