## Create NACl

```sh
aws ec2 create-network-acl --vpc-id vpc-01fc5219bd8f5cf17
```
## Add Entry

```sh
aws ec2 create-network-acl-entry \
    --network-acl-id acl-04373fbd703cf07ed \
    --ingress \
    --rule-number 90 \
    --protocol -1 \
    --port-range From=0,To=65535 \
    --cidr-block 106.215.178.199/32 \
    --rule-action deny
```

## Get AMI for Amazon Linux 2:

```sh
aws ec2 describe-images \
--owners amazon \
--filters "Name=name,Values=amzn2-ami-hvm-*-x86_64-gp2" \
--query "Images | sort_by(@, &CreationDate) [-1].ImageId" \
--region us-east-1 \
--output text

```