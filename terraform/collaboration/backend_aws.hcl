terraform {
    required_version = "~> 0.14.0"
backend "s3" {
    bucket = "terraform-20210115154959593100000001"
    key = "mjiao-api-deployment"
    region = "ap-southeast-1"
}
}

resource "aws_s3_bucket" "example_bucket" {}

output "bucket_name" {
    value = aws_s3_bucket.example_bucket.bucket
}