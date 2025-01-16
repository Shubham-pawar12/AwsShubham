## Create a new bucket

```sh
aws s3api create-bucket --bucket acl-example-1612 --region us-east-1
```


## Turn off block Public access for ACLs

```sh
aws s3api put-public-access-block \
--bucket acl-example-1612 \
--public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=true,RestrictPublicBuckets=true"
```

```sh
aws s3api get-public-access-block --bucket acl-example-1612 
```

## Change bucket ownership

```sh
aws s3api put-bucket-ownership-controls \
    --bucket acl-example-1612  \
    --ownership-controls="Rules=[{ObjectOwnership=BucketOwnerPreferred}]"
```

## Cleanup

```sh
aws s3 rb s3://acl-example-1612
```