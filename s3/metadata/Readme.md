## Create a bucket

aws s3 mb s3://metadata-fun-sp1612

## Create a new file

echo "hello yerwada" > hello.txt

## Upload file with metadata

aws s3api put-object --bucket metadata-fun-sp1612 --key hello.txt --body hello.txt --metadata Area=Yerwada

## Get metadat thorugh head object

aws s3api head-object --bucket metadata-fun-sp1612 --key hello.txt 