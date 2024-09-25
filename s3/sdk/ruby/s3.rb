require 'aws-sdk-s3'
require 'pry'
require 'securerandom'

# Fetch the bucket name from the environment variable and define the AWS region
bucket_name = ENV['BUCKET_NAME']
region = 'ca-central-1'
puts bucket_name

# Initialize the S3 client
client = Aws::S3::Client.new

# Create an S3 bucket with the specified name and region
resp = client.create_bucket({
  bucket: bucket_name,
  create_bucket_configuration: {
    location_constraint: region,
  }
})
#binding.pry

# Randomly select the number of files to generate (between 1 and 6)
number_of_files = 1 + rand(6)
puts "number_of_files: #{number_of_files}"

# Loop to generate, save, and upload files
number_of_files.times.each do |i|
  puts "i: #{i}"
  filename = "file_#{i}.txt"
  output_path = "/tmp/#{filename}"

  # Generate a random UUID and write it into the file
  File.open(output_path, "w") do |f|
    f.write SecureRandom.uuid
  end

  # Read the file and upload it to the S3 bucket
  File.open(output_path, 'rb') do |f|
    client.put_object(
      bucket: bucket_name,
      key: filename,
      body: f
    )
  end
end
