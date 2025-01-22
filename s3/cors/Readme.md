## Create website1
## Create a bucket

```sh
aws s3 mb s3://bucket-cors-example-sp-1612
```


## Change block public access

```sh
aws s3api put-public-access-block \
--bucket bucket-cors-example-sp-1612 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket bucket-cors-example-sp-1612 --policy file://bucket-policy.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket bucket-cors-example-sp-1612 --website-configuration file://website.json
```

## Upload our index.html file and include a resource that would be cross- origin

aws s3 cp index.html s3://bucket-cors-example-sp-1612

## View the website and see if the index.html is there

It is this for us-east-1
http://bucket-cors-example-sp-1612.s3-website.us-east-1.amazonaws.com

Others might use a hyphen instead
http://bucket-cors-example-sp-1612.s3-website-us-east-1.amazonaws.com


## Create website 2
## Create a bucket

```sh
aws s3 mb s3://bucket-cors-example-sp-161295
```

## Change block public access

```sh
aws s3api put-public-access-block \
--bucket bucket-cors-example-sp-161295 \
--public-access-block-configuration "BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=false,RestrictPublicBuckets=false"
```
## Create a bucket policy

```sh
aws s3api put-bucket-policy --bucket bucket-cors-example-sp-161295 --policy file://bucket-policy2.json
```

## Turn on static website hosting

```sh
aws s3api put-bucket-website --bucket bucket-cors-example-sp-161295 --website-configuration file://website.json
```

## Upload our javascript file and include a resource that would be cross- origin

aws s3 cp hello.js s3://bucket-cors-example-sp-161295


## Create API gateway with mock response and test the end point

curl -X POST "https://1gw0tx8945.execute-api.us-east-1.amazonaws.com/Prod/hello" \
-H "Content-Type: application/json" \
-d '{"key1": "value1", "key2": "value2"}'

## Set CORS on our bucket

aws s3api put-bucket-cors --bucket bucket-cors-example-sp-1612 --cors-configuration file://cors.json