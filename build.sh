#!/bin/bash

source /opt/buildpiper/shell-functions/log-functions.sh
source /opt/buildpiper/shell-functions/aws-functions.sh
source /opt/buildpiper/shell-functions/functions.sh

logInfoMessage "I'll be creating a policy for AWS resource [$AWS_RESOURCE]"

sleep  $SLEEP_DURATION

TASK_STATUS=0

envsubst < policy.template > policy 
POLICY_NAME=bp-${AWS_RESOURCE}-policy
AWS_ACCOUNT_ID=`getAccountId`
POLICY_ARN="arn:aws:iam::${AWS_ACCOUNT_ID}:policy/${POLICY_NAME}"

POLICY_EXISTS=`policyExists ${POLICY_ARN}`

if [ "$POLICY_EXISTS" -eq 0 ]
then
    logWarningMessage "Policy with ARN ${POLICY_ARN} already exists"
else
    logInfoMessage "Creating Policy with ARN ${POLICY_ARN}"
    getAssumeRole ${AWS_ASSUME_ROLE_ARN}
    createPolicy ${POLICY_NAME} policy
fi

saveTaskStatus ${TASK_STATUS} ${ACTIVITY_SUB_TASK_CODE}