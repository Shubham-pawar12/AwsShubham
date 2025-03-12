## Convert to json


The command
```sh
yq -o json policy.yml > policy.json
```

The bash script

```sh
./convert
```


```sh
aws iam create-policy \
    --policy-name my-fun-policy \
    --policy-document file://policy.json
```

# Attach user policy

```sh
aws iam attach-user-policy \
--policy-arn arn:aws:iam::047719639980:policy/my-fun-policy \
--user-name aws-examples
```    
