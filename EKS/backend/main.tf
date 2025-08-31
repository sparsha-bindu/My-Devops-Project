provider "aws" {
    region = "us-west-e"
  
}

resource "aws_s3_bucket" "example" {
    bucket = "demo-terraform-eks-state-S3-bucket"

    lifecycle {
      prevent_destroy = false
    }
  
}

resource "aws_dynamodb_table" "basic-dynamodb-table" {
  name           = "terraform-eks-state-locks"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockId"

  attribute {
    name = "LockId"
    type = "S"
  }
}