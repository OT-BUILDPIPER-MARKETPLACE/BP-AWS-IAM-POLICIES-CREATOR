#!/bin/bash

source /opt/buildpiper/shell-functions/log-functions.sh
source /opt/buildpiper/shell-functions/aws-functions.sh
source /opt/buildpiper/shell-functions/functions.sh

logInfoMessage "I'll be creating a policy for AWS resource [$AWS_RESOURCE]"

sleep  $SLEEP_DURATION

TASK_STATUS=0

envsubst < policy.template > policy 
POLICY_NAME=ot-${AWS_RESOURCE}-policy
POLICY_ARN="arn:aws:iam::639033570077:policy/${POLICY_NAME}"

POLICY_EXISTS=`policyExists ${POLICY_ARN}`

if [ "$POLICY_EXISTS" -eq 0 ]
then
    logWarningMessage "Policy with ARN ${POLICY_ARN} already exists"
else
    logInfoMessage "Creating Policy with ARN ${POLICY_ARN}"
    createPolicy ${POLICY_NAME} policy
fi

saveTaskStatus ${TASK_STATUS} ${ACTIVITY_SUB_TASK_CODE}