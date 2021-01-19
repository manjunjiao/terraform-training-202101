

terraform {
    required_version = "~> 0.14.0"
    backend "remote"{
        hostname     = "app.terraform.io"
        organization = "nobleprog-training"
        workspaces {
            name = "collaboration"
        }
    }
}

resource "aws_s3_bucket" "example_bucket" {}

output "bucket_name" {
    value = aws_s3_bucket.example_bucket.bucket
}


# How to refer to another team's state file
data "terraform_remote_state" "buckets" {
    backend "s3" {
        bucket = "terraform-20210115154959593100000001"
        key = "mjiao-api-deployment"
        region = "ap-southeast-1"
    }
}

output "remote-bucket" {
    value = data.terraform_remote_state.buckets.outputs
}