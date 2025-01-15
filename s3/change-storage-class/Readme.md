## Create a bucket

aws s3 mb s3://class-fun-sh-1612

## create a file

echo "Hello Pune" > hello.txt
aws s3 cp hello.txt s3://class-fun-sh-1612 --storage-class STANDARD_IA

## Clean up

aws s3 rm s3://class-fun-sh-1612/hello.txt
aws s3 rb s3://class-fun-sh-1612