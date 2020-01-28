#!/bin/sh

env
echo "1: ${INPUT_WORKING-DIRECTORY}"
cd ${INPUT_WORKING-DIRECTORY}
pwd
ls -hal

terraform init
terraform validate
