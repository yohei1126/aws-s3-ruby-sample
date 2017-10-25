require 'aws-sdk-s3'

if ARGV.length != 4 then
  print("bundle exec ruby sample.rb bucket key source_file id\n")
  exit
end

s3 = Aws::S3::Resource.new(region:'ap-northeast-1')
bucket = ARGV[0]
key = ARGV[1]
source_file = ARGV[2]
id = ARGV[3]

obj = s3.bucket(bucket).object(key)
obj.put({
  body: source_file,
  grant_full_control: "id=" + id,
  server_side_encryption: "AES256"
})