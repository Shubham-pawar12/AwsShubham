## Create a bucket

aws s3 mb s3://encryption-fun-sp-1612 


## Create a file 

echo "Hello Pune!!!!" > hello.txt
aws s3 cp hello.txt s3://encryption-fun-sp-1612 

## Put object with SSE-KMS

aws s3api put-object \
 --bucket encryption-fun-sp-1612 \
--key hello.txt \
--body hello.txt \
--server-side-encryption "aws:kms" \
--ssekms-key-id "a2331ba5-3c91-4619-b100-85e2f48a53d1"

## Put object with SSE-C [Failed attempt]

export BASE64_ENCODED_KEY=$(openssl rand -base64 32)

echo $BASE64_ENCODED_KEY

export MD5_VALUE=$(echo $BASE64_ENCODED_KEY | md5sum | awk '{print $1}' | base64 -w0)

echo $MD5_VALUE

aws s3api put-object \
 --bucket encryption-fun-sp-1612 \
--key hello.txt \
--body hello.txt \
--sse-customer-algorithm AES256 \
--sse-customer-key $BASE64_ENCODED_KEY \
--sse-customer-key-md5 $MD5_VALUE
