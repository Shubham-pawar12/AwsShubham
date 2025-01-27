## Createa a bucket

aws s3 mb s3://encrypt-client-fun-sp-1612

## Create a file

echo "Hello PUne!!!" > hello.txt

### Run our SDK ruby script

bundle exec ruby encrypt.rb

# Cleanup

aws s3 rm s3://encrypt-client-fun-sp-1612/hello.txt
aws s3 rb s3://encrypt-client-fun-sp-1612


