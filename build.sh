#!/bin/bash

source /opt/buildpiper/shell-functions/log-functions.sh
source /opt/buildpiper/shell-functions/aws-functions.sh

logInfoMessage "I'll be creating a policy for AWS resource [$AWS_RESOURCE]"

sleep  $SLEEP_DURATION

TASK_STATUS=0

envsubst < policy.template > policy 

createPolicy ot-${AWS_RESOURCE}-policy policy

saveTaskStatus ${TASK_STATUS} ${ACTIVITY_SUB_TASK_CODE}