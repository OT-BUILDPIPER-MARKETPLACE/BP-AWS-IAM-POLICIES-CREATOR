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
# Create poliyc with debugy
docker run -it --rm  --entrypoint sh aws-iam-policy-creator:0.1
```