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

AWS_DIR="ansible_aws"

if [[ "$OPTION" == "aws_create" ]]; then
  export DESTROY_AWS="false" && echo $DESTROY_AWS && cd $AWS_DIR && ansible-playbook aws_create.yml -v
elif [[ "$OPTION" == "aws_remove" ]]; then
  export DESTROY_AWS="true" && echo $DESTROY_AWS && cd $AWS_DIR && ansible-playbook aws_destroy.yml -v
elif [[ "$OPTION" == "owncloud_create" ]]; then
   cd $AWS_DIR && ansible-playbook owncloud.yml -v
elif [[ "$OPTION" == "full_create" ]]; then
  export DESTROY_AWS="false" && echo $DESTROY_AWS && cd $AWS_DIR && ansible-playbook aws_create.yml -v && ansible-playbook owncloud.yml -v
else 
 echo "Use instructions:
  - full_create -> To create a OwnCloud Infrastructure in AWS with OwnCloud
  - aws_create -> To create a OwnCloud Infrastructure in AWS
  - aws_remove -> To remove a OwnCloud Infrastructure in AWS
  - owncloud_create -> To install and configure OwnCloud
    After installation, you can access with admin user and mypasswordtest in passowrd field in admin address, port 8080."
fi
