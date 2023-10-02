FROM amazon/aws-cli

RUN yum update -y 
RUN yum install jq gettext -y

ENV SLEEP_DURATION 5s

COPY policy.template .

ADD BP-BASE-SHELL-STEPS /opt/buildpiper/shell-functions/