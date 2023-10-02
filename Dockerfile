FROM amazon/aws-cli

RUN yum update -y 
RUN yum install jq gettext -y

ENV SLEEP_DURATION 5s
ENV AWS_RESOURCE=s3
ENV ACTIVITY_SUB_TASK_CODE AWS_IAM_POLICY_CREATOR 

COPY policy.template .
COPY build.sh .

ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/

ENTRYPOINT [ "./build.sh" ]