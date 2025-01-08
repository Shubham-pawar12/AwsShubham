
## Create our bucket
```sh
aws s3 mb s3://prefixes-fun-sp-1612
```

## Create our folder
```sh
aws s3api put-object --bucket="prefixes-fun-sp-1612" --key="hello/"
```

## Create many folders
```sh
aws s3api put-object --bucket="prefixes-fun-sp-1612" --key="hello/"
```