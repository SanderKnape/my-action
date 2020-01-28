#!/bin/sh

cd ${INPUT_WORKING-DIRECTORY}
pwd
ls -hal

terraform init
terraform validate
