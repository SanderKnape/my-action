#!/bin/sh

export AWS_ACCESS_KEY_ID=${1}
export AWS_SECRET_ACCESS_KEY=${2}

if [ "${APP}" == "refs/heads/master"]; then
    export TAG_PREFIX="master-"
else
    export TAG_PREFIX="branch-"
fi

export IMAGE="${DOCKER_REPO_URL}/${APP}:${TAG_PREFIX}-${TAG}"
docker tag ${APP} ${IMAGE}
