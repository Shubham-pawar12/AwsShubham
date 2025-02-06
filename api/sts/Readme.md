## Create a user with no permissions

We need to create a user with no permissions and generate out access keys

```sh
aws iam create-user --user-name sts-machine-user
aws iam create-access-key --user-name sts-machine-user --output table
```


Copy the access key and secret here 
```sh
aws configure
```



Then edit credentials file to change away from default profile 

```sh
open ~/.aws/credentials
```

Test who you are:

```sh
aws sts get-caller-identity
aws sts get-caller-identity --profile sts
```

Make sure you don't have access to s3

```sh
aws s3 ls --profile sts
```


## Create a role

We need to create a role that will access a new resource

```sh
chmod u+x bin/deploy
./bin/deploy
```

## Use new user credentials and assume role

```sh
aws iam put-user-policy \
 --user-name sts-machine-user \
 --policy-name StsAssumePolicy \
 --policy-document file://policy.json
```

```sh
aws sts assume-role \
--role-arn arn:aws:iam::061882719348:role/my-sts-fun-stack-StsRole-RfOoNWfYFEvZ \
--role-session-name s3-sts-fun
--profile sts
```

## Cleanup

tear down your cloudformation stack via the AWS console

```sh
aws iam delete-user-policy --user-name sts-machine-user --policy-name StsAssumePolicy
aws iam delete-access-key --access-key-id AKIAQ42D7LR2HEZXNQPO --user-name sts-machine-user
aws iam delete-user --user-name sts-machine-user
```
