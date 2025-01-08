## Create a new s3 bucket

```md
aws s3 mb s3://checksums-ecxample-sp-1612
```

## Create a file that will we do a checksum on

```
echo "Hello Pune" > myfile.txt
```

## Get a checksum of a file for md5
md5sum myfile.txt

# c62ddfa62d8f465da6ae89f344903dee  myfile.txt

## Upload our file and look at its etag

```
aws s3 cp myfile.txt s3://checksums-ecxample-sp-1612
aws s3api head-object --bucket checksums-ecxample-sp-1612 --key myfile.txt
```

## Lets upload a file with different kind of checksum

```sh
sudo apt install rhash
rhash --crc32 --simple myfile.txt
```

```sh
aws s3 put-object \
--bucket checksums-ecxample-sp-1612 \
--key myfilecrc32.txt \
--body myfile.txt \
-- checksum-algorithm="CRC32" \
-- checksum-crc32="a96777bf"
```