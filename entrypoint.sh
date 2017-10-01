#!/bin/bash

OPTION=$1

if [[ -z "${AWS_ACCESS_KEY// }" ]]; then
    echo "AWS_ACCESS_KEY is empty, please use -e and send a value"
    exit 1
fi

if [[ -z "${AWS_SECRET_ACCESS_KEY// }" ]]; then
    echo "AWS_SECRET_ACCESS_KEY is empty, please use -e and send a value"
    exit 1
fi

case $1 in
aws_create)
  DESTROY_AWS=false ansible-playbook ansible_aws/provider.yml -vv
  ;;
aws_remove)
  DESTROY_AWS=true ansible-playbook ansible_aws/provider.yml -vv
  ;;
owncloud_create)
  ansible-playbook ansible_aws/owncloud.yml -vv
  ;;
*)
  echo "Use instructions:
  - aws_create -> To create a OwnCloud Infrastructure in AWS
  - aws_remove -> To remove a OwnCloud Infrastructure in AWS
  - owncloud_create -> To install and configure OwnCloud
    After installation, you can access with admin user and mypasswordtest in passowrd field in admin address, port 8080."
  ;;
esac
