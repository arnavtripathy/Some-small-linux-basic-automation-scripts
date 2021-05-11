resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-test-bucket"
  acl    = "private"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_object" "upload" {
  bucket = aws_s3_bucket.bucket.bucket
  key    = "new_object_key"
  source = "path/to/file"
}



