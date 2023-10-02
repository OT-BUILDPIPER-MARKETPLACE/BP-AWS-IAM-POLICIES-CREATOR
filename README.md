# BP-AWS-IAM-POLICIES-CREATOR
I'll let people to create admin AWS IAM policy for a specific resource via this step

## Setup
* Clone the code available at [BP-AWS-IAM-POLICY-CREATOR](https://github.com/OT-BUILDPIPER-MARKETPLACE/BP-AWS-IAM-POLICY-CREATOR)
* Build the docker image
```
git submodule init
git submodule update
docker build -t ot/aws-iam-policy-creator:0.1 .
```

* Do local testing via image only

```
# Create poliyc with debug
docker run -it --rm  --entrypoint sh ot/aws-iam-policy-creator:0.1

# Create default policy s3 
docker run -it --rm  -e AWS_ACCESS_KEY_ID=<xxx> -e AWS_SECRET_ACCESS_KEY=<xxx> ot/aws-iam-policy-creator:0.1

# Create another  policy rds 
docker run -it --rm -e AWS_RESOURCE=rds -e AWS_ACCESS_KEY_ID=<xxx> -e AWS_SECRET_ACCESS_KEY=<xxx> ot/aws-iam-policy-creator:0.1
```