#!/bin/sh

env
cd ${1}
pwd
ls -hal

terraform init
terraform validate
