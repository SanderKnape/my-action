#!/bin/sh

env
echo "1: ${1}"
cd ${1}
pwd
ls -hal

terraform init
terraform validate
